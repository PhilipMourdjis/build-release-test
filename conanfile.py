from conan import ConanFile
from conan.tools.cmake import CMakeToolchain


class TestConan(ConanFile):
    generators = "CMakeDeps"
    settings = "os", "compiler", "arch", "build_type"

    def generate(self):
        tc = CMakeToolchain(self)
        tc.user_presets_path = False
        tc.generate()

    def requirements(self):
        self.requires("catch2/3.3.0")
