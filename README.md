# QNAP-HDD-disks-spin-down

Set of scripts to manage how QNAP QTS uses connected drives. By default QTS spreads its operating system storage across all connected drives via 2 RAID1 arrays. These arrays are (typically) marked as md9 and md13. Assuming you want the OS to stay on the a specific drive (such as a SSD), these scripts will remove the other drives from these raid arrays so the HDDs can spin down.

These scripts are split into 3 main functions, disconnecting HDDs from these arrays, rebuilding the arrays, and setting up cron jobs for both of these when the NAS starts.
