import time
import os
import random

# List of common usernames for brute force simulation
USERNAMES = ["admin", "root", "user", "guest", "support", "test", "webmaster"]

# Common passwords
PASSWORDS = ["123456", "password", "qwerty", "admin123", "letmein"]

def simulate_failed_login(username, ip_address):
    """
    Simulates a failed login attempt by writing to /var/log/auth.log
    Note: Requires sudo/root permissions to write to auth.log
    """
    timestamp = time.strftime("%b %d %H:%M:%S")
    log_entry = f"{timestamp} ubuntu-vm sshd[1234]: Failed password for {username} from {ip_address} port {random.randint(1024, 65535)} ssh2\n"
    
    try:
        with open("/var/log/auth.log", "a") as f:
            f.write(log_entry)
        print(f"Simulated failed login for {username} from {ip_address}")
    except PermissionError:
        print("Error: Permission denied. Run with sudo to simulate auth.log entries.")

def main():
    print("Starting Brute Force Simulation...")
    target_ip = "192.168.1.100"
    
    # Simulate a burst of failed attempts to trigger Wazuh alerts
    for _ in range(15):
        username = random.choice(USERNAMES)
        simulate_failed_login(username, target_ip)
        time.sleep(random.uniform(0.1, 0.5))

if __name__ == "__main__":
    main()
