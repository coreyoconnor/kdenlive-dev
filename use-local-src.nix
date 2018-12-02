self: super: {
  kdenlive = super.kdenlive.overrideAttrs (oldAttrs: rec {
    src = self.lib.cleanSource ./kdenlive;
  });
  mlt = super.mlt.overrideAttrs (oldAttrs: rec {
    src = self.lib.cleanSource ./mlt;
  });
  movit = super.movit.overrideAttrs (oldAttrs: rec {
    src = self.lib.cleanSource ./movit;
    nativeBuildInputs = with self; oldAttrs.nativeBuildInputs ++ [ libtool ];
    buildInputs = with self; oldAttrs.buildInputs ++ [ autoconf gettext automake ];
    preConfigure = ''
      libtoolize --force --install --copy
      aclocal
      autoconf
    '';
  });
}
