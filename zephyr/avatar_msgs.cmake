set(msg_files
  "msg/L64x0.msg"
)

gen_files(
  headers sources
  MSG_DIR "${ZEPHYR_CURRENT_MODULE_DIR}"
  MSG_FILES "${msg_files}"
)

add_custom_target(ros2_gen_avatar_msgs_headers
  DEPENDS ${headers}
)

zephyr_interface_library_named(ros2_l64x0_msgs)
add_dependencies(ros2_l64x0_msgs ros2_gen_avatar_msgs_headers)
target_include_directories(ros2_l64x0_msgs INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/include)

zephyr_library()
zephyr_library_link_libraries(
  ros2_rosidl_runtime_c
  ros2_rosidl_typesupport_c
  ros2_rosidl_typesupport_microxrcedds_c
  ros2_microcdr
  ros2_std_msgs
  ros2_l64x0_msgs
)
zephyr_library_sources(${sources})
