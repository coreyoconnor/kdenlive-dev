self: super: {
  kdenlive = super.kdenlive.overrideAttrs (oldAttrs: rec {
    src = self.lib.cleanSource ./kdenlive;
  });
  mlt = super.mlt.overrideAttrs (oldAttrs: rec {
    src = self.lib.cleanSource ./mlt;
  });
  movit = super.movit.overrideAttrs (oldAttrs: rec {
    src = self.lib.cleanSource ./movit;
  });
}
