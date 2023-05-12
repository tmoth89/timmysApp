# Arrival Bank Small Test Task

# Instructions to run small project:
# 1.) Dockerfile for node.js application.
      - After you have cloned the repo, make sure you are under the "timmysApp" directory.
      - Run the command "docker build -t my-webapp ."
      - Next run "docker run -d -p 8080:80 my-webapp"
      - You should see the application running on "http://localhost:8080/"
# 2.) Prepare a docker-compose with Loki, Grafana, Promtail and nodeJS application.
      - After you have cloned the repo, make sure you are under the "timmysApp" directory.
      - If you have ran the above application(Part 1) make sure to bring container down to avoid port conflicts.
      - MAKE MINOR CHANGE IN App.js file:  Change 'localhost' to 'timmysapp-backend' Ex.) apiUrl = 'http://timmysapp-backend:8080/api/users';
        Will need to do this to make request on frontend.
      - Next, Run the command "docker-compose up -d"
      - You should see the application running on "http://localhost:80/"
      - Grafana will be running on "localhost:3000/"
# 3.) Write a simple script (in any language) that will print the numbers from 0 to 100 and convert every tenth to a wordy version.
      - After you have cloned the repo, make sure you are under the "timmysApp" directory.
      - Solved problem using Python inside of file pyCount.py
      - To run code use python3 pyCount.py or python pyCount.py
      - You should get the desired output.