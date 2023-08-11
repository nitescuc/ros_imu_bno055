FROM docker.io/ros:noetic-ros-base-focal

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y python3-pip
RUN rosdep update

RUN mkdir -p /catkin_ws/src/ros_imu_bno055
WORKDIR /catkin_ws

ADD . /catkin_ws/src/ros_imu_bno055

RUN cd src/ros_imu_bno055 && chmod +x run.sh && pip3 install -r requirements.txt
RUN bash -c "source /opt/ros/noetic/setup.bash && catkin_make"

CMD [ "run.sh" ]
