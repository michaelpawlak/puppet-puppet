class puppet::install inherits ::puppet {
  ensure_packages($packages)
}
