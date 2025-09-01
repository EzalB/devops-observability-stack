import requests
import time

HOST = "http://localhost:8080"

print(f"Starting load test against {HOST}...")

while True:
    # Send 100 normal requests
    for _ in range(100):
        try:
            requests.get(f"{HOST}/")
        except Exception as e:
            print("Error:", e)

    # Send 20 error requests
    for _ in range(20):
        try:
            requests.get(f"{HOST}/error")
        except Exception as e:
            print("Error:", e)

    print("Batch sent: 100 OK + 20 Error")
    time.sleep(2)
