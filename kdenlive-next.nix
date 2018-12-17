self: super: rec {
  kdenlive = (super.kdenlive.overrideAttrs (oldAttrs: rec {
    name = "kdenlive-${version}";
    version = "19-03-70";
    rev = "1afe13e9c09cd5321de0c3bc6292f05486257313";

    src = self.fetchgit {
      inherit rev;
      url = "git://anongit.kde.org/kdenlive.git";
      sha256 = "1akm8ygzvh7dv5q3kllssi3c9f8jlswiikhkfkbkx1x76pna9cqy";
    };

    buildInputs = oldAttrs.buildInputs ++ [ self.libsForQt5.kdeclarative self.libsForQt5.kpurpose ];
    enableParallelBuilding = true;
  })).override {
    inherit (self) mlt;
  };

  mlt = (super.libsForQt5.mlt.overrideAttrs( oldAttrs: rec {
    name = "mlt-${version}";
    version = "6.13.0";
    src = self.fetchFromGitHub {
      owner = "mltframework";
      repo = "mlt";
      rev = "adc5a2284b3a1073cb364c5f07d1d7c97e94c937";
      sha256 = "140sb6j41xkgfp9ggra2m1lcj1865bx490vk7svm3phh73fymkm2";
    };
    buildInputs = with self; oldAttrs.buildInputs ++ [ SDL2 ];
  })).override {
    inherit (self) movit;
  };

  movit = super.movit.overrideAttrs( oldAttrs: rec {
    name = "movit-${version}";
    version = "1.6.2";

    buildInputs = oldAttrs.buildInputs ++ [ self.SDL2 ];
    doCheck = false;
    GTEST_DIR = "${self.gtest.src}/googletest";

    src = self.fetchurl {
      url = "https://movit.sesse.net/${name}.tar.gz";
      sha256 = "1q9h086v6h3da4b9qyflcjx73cgnqjhb92rv6g4j90m34dndaa3l";
    };
  });
}
