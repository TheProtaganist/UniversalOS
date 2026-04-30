# UniversalOS Immutable System Architecture

## Overview

UniversalOS implements an **immutable desktop system** inspired by modern immutable Linux distributions (Fedora Silverblue, openSUSE MicroOS) combined with Windows-like system protection. The root filesystem is read-only, preventing accidental system breakage while maintaining full sudo capabilities for authorized operations.

## Core Principles

### 1. Immutability
- **Read-only root filesystem** - System files cannot be modified during normal operation
- **Atomic updates** - System updates are transactional (all-or-nothing)
- **Rollback capability** - Easy rollback to previous system states
- **Layered architecture** - Separate system, application, and user data layers

### 2. Windows-Like Protection
- **System integrity** - Core system files protected from accidental modification
- **Sudo with safety** - Administrative privileges available but with guardrails
- **User-space isolation** - User applications cannot break the system
- **Recovery mode** - Built-in recovery options for system restoration

### 3. User Experience
- **Transparent to users** - Immutability works behind the scenes
- **No workflow disruption** - Users can still install software and customize
- **Beautiful interface** - Cutefish-like modern, clean desktop environment
- **Hard to break** - System remains stable even with user experimentation

## Architecture Layers

### Layer 1: Immutable Base System (Read-Only)
```
/usr/          - System binaries and libraries (read-only)
/etc/          - System configuration (read-only base, overlays for changes)
/boot/         - Bootloader and kernels (read-only)
/opt/          - Optional system software (read-only)
```

**Implementation**: OSTree-based system with read-only root filesystem

**Features**:
- Atomic updates via OSTree commits
- Cryptographic verification of system state
- Efficient storage (deduplication, compression)
- Fast rollback (just switch OSTree deployment)

### Layer 2: Mutable Overlays (Read-Write)
```
/etc/          - Configuration overlays (OverlayFS)
/var/          - Variable data (logs, caches, databases)
/home/         - User home directories
/tmp/          - Temporary files
```

**Implementation**: OverlayFS for /etc, standard mounts for others

**Features**:
- Configuration changes persist via overlays
- System logs and data in /var
- User data completely separate
- Temporary files cleared on boot

### Layer 3: Application Layer (Containerized)
```
Flatpak        - Desktop applications (sandboxed)
Podman         - System containers (rootless)
Toolbox        - Development environments
AppImage       - Portable applications
```

**Implementation**: Multiple application delivery methods

**Features**:
- Sandboxed applications (cannot break system)
- Per-application permissions
- Easy installation/removal
- Automatic updates

### Layer 4: User Data Layer (Fully Mutable)
```
/home/user/    - User files and settings
~/.local/      - User-installed applications
~/.config/     - User configurations
~/.cache/      - User caches
```

**Implementation**: Standard filesystem, separate partition recommended

**Features**:
- Full user control
- Backed up separately from system
- Survives system reinstalls
- Encrypted by default (LUKS)

## Immutability Implementation

### OSTree-Based System

**OSTree** (libostree) provides Git-like versioning for the entire filesystem:

```
/ostree/
├── repo/                    # OSTree repository (all system versions)
├── deploy/
│   └── universalos/
│       ├── deploy/
│       │   ├── current/     # Current system (symlink)
│       │   ├── 0/           # Deployment 0 (current)
│       │   ├── 1/           # Deployment 1 (previous)
│       │   └── 2/           # Deployment 2 (older)
│       └── var/             # Shared /var across deployments
```

**Benefits**:
- **Atomic updates**: New system version deployed alongside current
- **Instant rollback**: Just boot into previous deployment
- **Minimal storage**: Deduplication and hardlinks
- **Integrity**: Cryptographic checksums for all files

### Read-Only Root Filesystem

**Mount Configuration**:
```bash
# Root filesystem mounted read-only
/dev/mapper/root on / type ext4 (ro,relatime)

# /etc uses OverlayFS for configuration changes
overlay on /etc type overlay (rw,lowerdir=/usr/etc,upperdir=/var/etc,workdir=/var/etc-work)

# /var is read-write for logs and data
/dev/mapper/var on /var type ext4 (rw,relatime)

# /home is read-write for user data
/dev/mapper/home on /home type ext4 (rw,relatime)
```

**Protection Mechanisms**:
- Kernel enforces read-only mount
- SELinux/AppArmor policies prevent remounting
- Systemd units protect critical paths
- Audit logging for system modification attempts

### Configuration Management

**Three-Layer Configuration**:

1. **Base Configuration** (Read-Only)
   - `/usr/etc/` - Default system configuration
   - Shipped with OSTree commit
   - Never modified after deployment

2. **System Overlays** (Read-Write)
   - `/var/etc/` - System administrator changes
   - Overlaid on top of base configuration
   - Persists across updates

3. **User Configuration** (Read-Write)
   - `~/.config/` - User-specific settings
   - Completely independent of system
   - Backed up separately

**Example**: Editing `/etc/fstab`
```bash
# User edits /etc/fstab
sudo nano /etc/fstab

# Behind the scenes:
# 1. OverlayFS copies /usr/etc/fstab to /var/etc/fstab
# 2. Changes written to /var/etc/fstab
# 3. /etc/fstab shows merged view
# 4. Original /usr/etc/fstab remains unchanged
```

## System Updates

### Atomic Update Process

**Update Flow**:
```
1. Download new OSTree commit
   ↓
2. Deploy new system alongside current
   ↓
3. Verify integrity (checksums)
   ↓
4. Update bootloader (add new entry)
   ↓
5. Reboot into new system
   ↓
6. Verify boot success
   ↓
7. Mark new deployment as default
   ↓
8. Keep old deployment for rollback
```

**Commands**:
```bash
# Check for updates
sudo universalos-update check

# Download and stage update
sudo universalos-update stage

# Apply update (reboot required)
sudo universalos-update apply

# Rollback to previous version
sudo universalos-rollback

# List available deployments
universalos-status
```

**Safety Features**:
- **Staged updates**: Downloaded and prepared before reboot
- **Automatic rollback**: If new system fails to boot, automatically boot previous
- **Health checks**: System verifies functionality after update
- **Retention policy**: Keep last 3 deployments for rollback

### Update Strategies

**Automatic Updates** (Default):
- Check for updates daily
- Download and stage automatically
- Notify user to reboot
- Apply on next reboot

**Manual Updates**:
- User initiates update check
- Review changes before applying
- Schedule update for convenient time

**Enterprise Updates**:
- Centralized update server
- Staged rollout (canary, beta, stable)
- Update policies (maintenance windows)
- Compliance reporting

## Windows-Like System Protection

### Sudo with Guardrails

**Protected Operations**:
```bash
# These operations require special handling:
sudo universalos-update apply     # System update (atomic)
sudo universalos-rollback          # System rollback (atomic)
sudo rpm-ostree install <pkg>     # Install system package (atomic)
sudo flatpak install <app>        # Install application (sandboxed)
```

**Blocked Operations**:
```bash
# These operations are prevented:
sudo rm -rf /usr/*                # Cannot modify read-only filesystem
sudo chmod 777 /etc/shadow        # SELinux prevents security violations
sudo systemctl disable firewall   # Critical services protected
```

**Smart Warnings**:
```bash
$ sudo rm /usr/bin/bash
Error: Cannot modify read-only filesystem
Hint: System files are protected. Use 'universalos-update' to modify the system.

$ sudo chmod 777 /etc/shadow
Error: SELinux policy violation
Hint: This operation would compromise system security and is blocked.
```

### User-Space Isolation

**Application Sandboxing**:
- **Flatpak**: Desktop applications run in sandboxes
  - Limited filesystem access
  - No direct hardware access
  - Controlled network access
  - Per-app permissions (portals)

- **Podman**: Containers for system services
  - Rootless by default
  - SELinux confinement
  - Resource limits (cgroups)
  - Network isolation

**Example Flatpak Permissions**:
```bash
# Firefox has limited access
flatpak info --show-permissions org.mozilla.firefox

# Permissions:
# - Network: yes
# - Filesystem: ~/Downloads (read-write)
# - Filesystem: ~/Documents (read-only)
# - Device: dri (GPU access)
# - No access to: /etc, /usr, /var, other users' files
```

### Recovery Mode

**Boot Options**:
1. **Normal Boot** - Current system deployment
2. **Previous Boot** - Last known good deployment
3. **Recovery Mode** - Minimal system for repairs
4. **Emergency Shell** - Root shell for advanced recovery

**Recovery Tools**:
```bash
# In recovery mode:
universalos-doctor          # Diagnose system issues
universalos-rollback        # Rollback to previous deployment
universalos-reset           # Reset to factory state (keep user data)
universalos-rescue          # Mount filesystems for manual repair
```

**Automatic Recovery**:
- Failed boot detection (3 failed boots → automatic rollback)
- Filesystem corruption detection (fsck on boot)
- Kernel panic handling (boot previous kernel)
- Service failure handling (systemd emergency mode)

## Package Management

### System Packages (rpm-ostree)

**Installing System Packages**:
```bash
# Install package (requires reboot)
sudo rpm-ostree install htop

# Install multiple packages
sudo rpm-ostree install vim git tmux

# Remove package
sudo rpm-ostree uninstall htop

# Apply changes (reboot)
sudo systemctl reboot
```

**Layered Packages**:
- Installed on top of base system
- Persist across updates
- Can be removed to return to base
- Stored in OSTree overlay

### Application Packages (Flatpak)

**Installing Applications**:
```bash
# Install from Flathub
flatpak install flathub org.mozilla.firefox

# Install from file
flatpak install firefox.flatpakref

# Update all applications
flatpak update

# Remove application
flatpak uninstall org.mozilla.firefox
```

**Benefits**:
- No reboot required
- Sandboxed (cannot break system)
- Automatic updates
- Multiple versions possible

### Development Tools (Toolbox)

**Creating Development Environments**:
```bash
# Create Arch Linux toolbox
toolbox create --distro arch dev-env

# Enter toolbox
toolbox enter dev-env

# Inside toolbox (full Arch Linux):
sudo pacman -S gcc make cmake
# ... develop as normal ...
exit

# Toolbox is isolated from host system
```

**Benefits**:
- Full mutable environment for development
- Cannot affect host system
- Multiple environments (different distros, versions)
- Persistent across host updates

## Comprehensive Package Set

### Base System Packages

**Core System**:
- Linux kernel (latest stable + Helix modules)
- systemd (init system)
- OSTree (immutable system management)
- rpm-ostree (package layering)
- Flatpak (application sandboxing)
- Podman (container runtime)
- Toolbox (development environments)

**Networking**:
- NetworkManager (network management)
- firewalld (firewall)
- OpenSSH (remote access)
- curl, wget (download tools)
- bind-utils (DNS tools)

**Filesystem**:
- btrfs-progs (Btrfs utilities)
- e2fsprogs (ext4 utilities)
- dosfstools (FAT utilities)
- ntfs-3g (NTFS support)
- fuse (FUSE filesystem support)

**Hardware Support**:
- mesa (GPU drivers)
- vulkan-tools (Vulkan support)
- alsa-utils (audio)
- pulseaudio / pipewire (audio server)
- bluez (Bluetooth)
- cups (printing)

**Development Tools** (in base):
- git (version control)
- gcc, clang (compilers)
- make, cmake (build systems)
- python3, python-pip (Python)
- rust, cargo (Rust)
- julia (Julia)

**System Utilities**:
- vim, nano (text editors)
- htop, btop (system monitors)
- tmux, screen (terminal multiplexers)
- rsync (file sync)
- tar, zip, unzip (archives)
- gnupg (encryption)

### Desktop Environment Packages

**Cutefish Desktop** (or similar):
- cutefish-core (desktop shell)
- cutefish-settings (system settings)
- cutefish-filemanager (file manager)
- cutefish-terminal (terminal emulator)
- cutefish-calculator (calculator)
- cutefish-texteditor (text editor)
- cutefish-screenshot (screenshot tool)

**Display Server**:
- Wayland (modern display protocol)
- XWayland (X11 compatibility)
- wlroots (Wayland compositor library)

**Desktop Applications** (Flatpak):
- Firefox (web browser)
- Thunderbird (email client)
- LibreOffice (office suite)
- GIMP (image editor)
- VLC (media player)
- VS Code (code editor)

**Fonts**:
- noto-fonts (comprehensive Unicode)
- noto-fonts-cjk (Chinese, Japanese, Korean)
- noto-fonts-emoji (emoji support)
- liberation-fonts (metric-compatible with Arial, Times, Courier)
- ttf-dejavu (high-quality fonts)

### Quantum-Specific Packages

**Helix Kernel Modules**:
- helix-quantum-core (quantum state management)
- helix-mcginty-storage (M-Wave storage)
- helix-vacuum-interface (ZPVI)
- helix-reversible-compute (reversible computing)

**Quantum Development**:
- qutrit-simulator (qutrit simulation)
- mcginty-tools (M-Wave utilities)
- vacuum-rng (vacuum random number generator)
- quantum-debugger (quantum state debugging)

**Libraries**:
- libqutrit (qutrit state library)
- libmcginty (McGinty equation solver)
- libvacuum (vacuum interface library)
- libreversible (reversible computing library)

## Security

### SELinux Integration

**Mandatory Access Control**:
- All processes confined by SELinux policy
- System files protected even from root
- Application sandboxing enforced
- Audit logging for policy violations

**Policies**:
- `system_u:system_r:kernel_t` - Kernel and core system
- `system_u:system_r:init_t` - Systemd and services
- `unconfined_u:unconfined_r:unconfined_t` - User processes (confined by Flatpak)
- `user_u:user_r:user_t` - User applications

### Secure Boot

**Boot Chain Verification**:
1. UEFI firmware (signed by hardware vendor)
2. Shim bootloader (signed by Microsoft)
3. GRUB bootloader (signed by UniversalOS)
4. Linux kernel (signed by UniversalOS)
5. Initramfs (verified by kernel)
6. OSTree deployment (cryptographic checksums)

**Benefits**:
- Prevents rootkits and bootkits
- Ensures system integrity from power-on
- Detects tampering with system files

### Encryption

**Full Disk Encryption**:
- LUKS2 for all partitions
- TPM 2.0 integration (automatic unlock)
- Secure key storage
- Recovery key backup

**Partitions**:
```
/dev/sda1  - EFI System Partition (unencrypted, signed)
/dev/sda2  - Boot partition (unencrypted, signed)
/dev/sda3  - LUKS container
  ├── root   - Root filesystem (OSTree)
  ├── var    - Variable data
  └── home   - User data
```

## Performance

### Optimizations

**OSTree Efficiency**:
- Hardlinks for unchanged files (minimal storage)
- Compression (zstd) for OSTree objects
- Deduplication across deployments
- Lazy loading of metadata

**Boot Performance**:
- Systemd parallel service startup
- Minimal initramfs (only essential drivers)
- Preloaded frequently-used applications
- SSD optimization (TRIM, discard)

**Runtime Performance**:
- Read-only root (no filesystem overhead)
- OverlayFS for /etc (minimal overhead)
- Flatpak runtime sharing (one runtime for multiple apps)
- Podman rootless (no daemon overhead)

### Storage Requirements

**Base System**:
- OSTree repository: ~5 GB (compressed)
- Current deployment: ~8 GB (with hardlinks)
- Previous deployment: ~500 MB (only changed files)
- Total for 3 deployments: ~10 GB

**Applications**:
- Flatpak runtimes: ~2 GB (shared across apps)
- Flatpak applications: ~500 MB per app (average)
- Podman containers: varies

**User Data**:
- Depends on user usage
- Recommend 50+ GB for /home

**Total Recommended**: 128 GB minimum, 256 GB recommended

## User Experience

### Transparent Immutability

**Users Don't Need to Know**:
- System "just works" and stays stable
- Software installation works normally (Flatpak)
- Configuration changes work normally (OverlayFS)
- Updates are automatic and safe

**When Users Notice**:
- System updates require reboot (but are atomic)
- Some system packages require reboot to install
- System is very hard to break (this is good!)

### Software Installation

**Desktop Applications** (Recommended):
```bash
# Install from Software Center (GUI)
# or
flatpak install firefox
```

**System Packages** (Advanced):
```bash
# Install system package (requires reboot)
sudo rpm-ostree install htop
sudo systemctl reboot
```

**Development Tools** (Recommended):
```bash
# Create development environment
toolbox create dev
toolbox enter dev
# Now in full Arch Linux environment
sudo pacman -S whatever-you-need
```

### System Maintenance

**Updates**:
- Automatic by default
- Notification when update ready
- Reboot to apply
- Automatic rollback if problems

**Rollback**:
```bash
# If something goes wrong after update:
sudo universalos-rollback
sudo systemctl reboot
# System restored to previous state
```

**Reset**:
```bash
# Reset system to factory state (keep user data)
sudo universalos-reset --keep-home
# System restored, /home preserved
```

## Comparison with Other Systems

### vs. Traditional Arch Linux

| Feature | UniversalOS | Traditional Arch |
|---------|-------------|------------------|
| **System Stability** | Very high (immutable) | Depends on user |
| **Breakage Risk** | Very low | Can break with wrong command |
| **Updates** | Atomic, rollback | In-place, no rollback |
| **Package Management** | OSTree + Flatpak | Pacman |
| **Reboot for Updates** | System packages only | No |
| **Recovery** | Built-in, automatic | Manual |

### vs. Windows

| Feature | UniversalOS | Windows |
|---------|-------------|---------|
| **System Protection** | Read-only root | System file protection |
| **Admin Rights** | Sudo with guardrails | UAC prompts |
| **Updates** | Atomic, rollback | In-place, restore points |
| **Application Sandboxing** | Flatpak (strong) | UWP (moderate) |
| **Recovery** | Automatic rollback | System restore |
| **User Experience** | Similar protection level | Similar protection level |

### vs. Fedora Silverblue

| Feature | UniversalOS | Fedora Silverblue |
|---------|-------------|-------------------|
| **Base** | Arch Linux | Fedora |
| **Immutability** | OSTree | OSTree |
| **Package Manager** | rpm-ostree | rpm-ostree |
| **Applications** | Flatpak | Flatpak |
| **Desktop** | Cutefish-like | GNOME |
| **Quantum Features** | Yes (Helix kernel) | No |
| **Fractal Storage** | Yes (M-Wave) | No |

## Implementation Roadmap

### Phase 1: Base Immutable System (Week 1-2)
- Set up OSTree repository structure
- Configure read-only root filesystem
- Implement OverlayFS for /etc
- Create atomic update mechanism
- Test rollback functionality

### Phase 2: Package Management (Week 2-3)
- Integrate rpm-ostree for system packages
- Set up Flatpak for applications
- Configure Flathub repository
- Implement Toolbox for development
- Create package installation workflows

### Phase 3: System Protection (Week 3-4)
- Configure SELinux policies
- Implement sudo guardrails
- Set up secure boot chain
- Configure full disk encryption
- Create recovery mode

### Phase 4: Desktop Integration (Week 4-5)
- Install Cutefish desktop environment
- Configure Wayland display server
- Set up application sandboxing
- Integrate system settings
- Create beautiful UI/UX

### Phase 5: Testing & Refinement (Week 5-6)
- Test update and rollback scenarios
- Verify system protection mechanisms
- Performance optimization
- User experience refinement
- Documentation

## Conclusion

UniversalOS's immutable architecture provides:
- **Stability**: System cannot be accidentally broken
- **Security**: Read-only root, SELinux, sandboxing
- **Reliability**: Atomic updates, automatic rollback
- **Usability**: Windows-like protection with Linux flexibility
- **Beauty**: Cutefish-like modern desktop environment

The system is **hard to break** while remaining **fully functional** for all user needs. Users get the best of both worlds: the stability and protection of an immutable system with the flexibility and power of Arch Linux.
