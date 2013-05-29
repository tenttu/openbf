-- A solution contains projects, and defines the available configurations
solution "OpenBF"
   configurations { "Debug", "Release" }
   links {"glu32", "opengl32", "gdi32", "winmm", "user32"}
   libdirs { "3rdParty/**" }
   includedirs { "3rdParty/**" }
   configuration "Debug"
      targetdir "bin/"
 
   configuration "Release"
      targetdir "bin/"

   -- A project defines one build target
   project "obfEngine"
      kind "SharedLib"
      language "C++"
      files { "obfEngine/src/*.cpp", "obfEngine/include/*.h" }
      location "obfEngine"
 
      configuration "Debug"
         defines { "DEBUG" }
         flags { "Symbols" }
 
      configuration "Release"
         defines { "NDEBUG" }
         flags { "Optimize" }    
 
   -- A project defines one build target
   project "OpenBF"
      kind "ConsoleApp"
      language "C++"
      files { "OpenBF/src/*.cpp", "OpenBF/include/*.h" }
      location "OpenBF"
      links { "GLFW", "obfEngine" }
 
      configuration "Debug"
         defines { "DEBUG" }
         flags { "Symbols" }
 
      configuration "Release"
         defines { "NDEBUG" }
         flags { "Optimize" }    