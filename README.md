# kdenlive-dev

## to sort

~~~
kdenlive: resource_pool.cpp:612: GLuint movit::ResourcePool::create_vec2_vao(const std::set<int>&, GLuint): Assertion `vao_formats.count(key) == 0' failed.
~~~


~~~
#4  0x0000155516f6137a in movit::ResourcePool::create_vec2_vao(std::set<int, std::less<int>, std::allocator<int> > const&, unsigned int)
    () from /nix/store/h0q1l661sm5j8q1g971kk8b0pysrjvac-movit-1.6.2/lib/libmovit.so.8
    #5  0x0000155516f4a237 in movit::EffectChain::execute_phase(movit::Phase*, std::map<movit::Phase*, unsigned int, std::less<movit::Phase*>, std::allocator<std::pair<movit::Phase* const, unsigned int> > > const&, std::vector<movit::EffectChain::DestinationTexture, std::allocator<movit::EffectChain::DestinationTexture> > const&, std::set<movit::Phase*, std::less<movit::Phase*>, std::allocator<movit::Phase*> >*) () from /nix/store/h0q1l661sm5j8q1g971kk8b0pysrjvac-movit-1.6.2/lib/libmovit.so.8
    #6  0x0000155516f50ef5 in movit::EffectChain::render(unsigned int, std::vector<movit::EffectChain::DestinationTexture, std::allocator<movit::EffectChain::DestinationTexture> > const&, unsigned int, unsigned int, unsigned int, unsigned int) ()
       from /nix/store/h0q1l661sm5j8q1g971kk8b0pysrjvac-movit-1.6.2/lib/libmovit.so.8
       #7  0x0000155516f51d15 in movit::EffectChain::render_to_fbo(unsigned int, unsigned int, unsigned int) ()
          from /nix/store/h0q1l661sm5j8q1g971kk8b0pysrjvac-movit-1.6.2/lib/libmovit.so.8
          #8  0x00001555171dd5cf in GlslManager::render_frame_texture(movit::EffectChain*, mlt_frame_s*, int, int, unsigned char**) ()
             from /nix/store/5wg0wvalv9k3wsxvivjcmxfvlccx175y-mlt-6.13.0/lib/mlt/libmltopengl.so
             #9  0x00001555171e0c2a in convert_image(mlt_frame_s*, unsigned char**, mlt_image_format*, mlt_image_format) ()
                from /nix/store/5wg0wvalv9k3wsxvivjcmxfvlccx175y-mlt-6.13.0/lib/mlt/libmltopengl.so
                #10 0x000015554ef9d3de in mlt_frame_get_image () from /nix/store/5wg0wvalv9k3wsxvivjcmxfvlccx175y-mlt-6.13.0/lib/libmlt.so.6
                #11 0x000015554efb2aa9 in producer_get_image () from /nix/store/5wg0wvalv9k3wsxvivjcmxfvlccx175y-mlt-6.13.0/lib/libmlt.so.6
                #12 0x000015554ef9d37f in mlt_frame_get_image () from /nix/store/5wg0wvalv9k3wsxvivjcmxfvlccx175y-mlt-6.13.0/lib/libmlt.so.6
                #13 0x000015554efb012f in consumer_read_ahead_thread () from /nix/store/5wg0wvalv9k3wsxvivjcmxfvlccx175y-mlt-6.13.0/lib/libmlt.so.6
                #14 0x00000000007ddbfd in RenderThread::run (this=0x1554640f4020)
                    at /home/coconnor/Development/kdenlive-dev/kdenlive/src/monitor/glwidget.cpp:1501

~~~

~~~
[New LWP 371317]
GL error 0x502 (GL_INVALID_OPERATION) at effect_chain.cpp:2302

Thread 446 "RenderThread" received signal SIGABRT, Aborted.
[Switching to LWP 371317]
0x00001555480eebe0 in raise () from /nix/store/wba8ipxcf5742j33w1c9g12klw75xdid-glibc-2.27/lib/libc.so.6
(gdb) bt
#0  0x00001555480eebe0 in raise () from /nix/store/wba8ipxcf5742j33w1c9g12klw75xdid-glibc-2.27/lib/libc.so.6
#1  0x00001555480efdc1 in abort () from /nix/store/wba8ipxcf5742j33w1c9g12klw75xdid-glibc-2.27/lib/libc.so.6
#2  0x0000155516f3ec29 in movit::abort_gl_error(unsigned int, char const*, int) ()
from /nix/store/h0q1l661sm5j8q1g971kk8b0pysrjvac-movit-1.6.2/lib/libmovit.so.8
#3  0x0000155516f4a2b5 in movit::EffectChain::execute_phase(movit::Phase*, std::map<movit::Phase*, unsigned int, std::less<movit::Phase*>, std::allocator<std::pair<movit::Phase* const, unsigned int> > > const&, std::vector<movit::EffectChain::DestinationTexture, std::allocator<movit::EffectChain::DestinationTexture> > const&, std::set<movit::Phase*, std::less<movit::Phase*>, std::allocator<movit::Phase*> >*) () from /nix/store/h0q1l661sm5j8q1g971kk8b0pysrjvac-movit-1.6.2/lib/libmovit.so.8
#4  0x0000155516f50ef5 in movit::EffectChain::render(unsigned int, std::vector<movit::EffectChain::DestinationTexture, std::allocator<movit::EffectChain::DestinationTexture> > const&, unsigned int, unsigned int, unsigned int, unsigned int) ()
from /nix/store/h0q1l661sm5j8q1g971kk8b0pysrjvac-movit-1.6.2/lib/libmovit.so.8
#5  0x0000155516f51d15 in movit::EffectChain::render_to_fbo(unsigned int, unsigned int, unsigned int) ()
from /nix/store/h0q1l661sm5j8q1g971kk8b0pysrjvac-movit-1.6.2/lib/libmovit.so.8
#6  0x00001555171dd5cf in GlslManager::render_frame_texture(movit::EffectChain*, mlt_frame_s*, int, int, unsigned char**) ()
from /nix/store/5wg0wvalv9k3wsxvivjcmxfvlccx175y-mlt-6.13.0/lib/mlt/libmltopengl.so
#7  0x00001555171e0c2a in convert_image(mlt_frame_s*, unsigned char**, mlt_image_format*, mlt_image_format) ()
from /nix/store/5wg0wvalv9k3wsxvivjcmxfvlccx175y-mlt-6.13.0/lib/mlt/libmltopengl.so
#8  0x000015554ef9d3de in mlt_frame_get_image () from /nix/store/5wg0wvalv9k3wsxvivjcmxfvlccx175y-mlt-6.13.0/lib/libmlt.so.6
#9  0x000015554efb2aa9 in producer_get_image () from /nix/store/5wg0wvalv9k3wsxvivjcmxfvlccx175y-mlt-6.13.0/lib/libmlt.so.6
#10 0x000015554ef9d37f in mlt_frame_get_image () from /nix/store/5wg0wvalv9k3wsxvivjcmxfvlccx175y-mlt-6.13.0/lib/libmlt.so.6
#11 0x000015554efb012f in consumer_read_ahead_thread () from /nix/store/5wg0wvalv9k3wsxvivjcmxfvlccx175y-mlt-6.13.0/lib/libmlt.so.6
#12 0x00000000007ddbfd in RenderThread::run (this=0x15549c0035b0)
at /home/coconnor/Development/kdenlive-dev/kdenlive/src/monitor/glwidget.cpp:1505
#13 0x000015554906712b in ?? () from /nix/store/1g05l9p3qcw9l9l27jvnxaqf1w1b8iv2-qtbase-5.11.1/lib/libQt5Core.so.5
#14 0x0000155545ec25a7 in start_thread () from /nix/store/wba8ipxcf5742j33w1c9g12klw75xdid-glibc-2.27/lib/libpthread.so.0
#15 0x00001555481ac22f in clone () from /nix/store/wba8ipxcf5742j33w1c9g12klw75xdid-glibc-2.27/lib/libc.so.6
~~~


~~~

#1  0x00007ffff1cd1672 in abort () at /usr/lib/libc.so.6
#2  0x00007ffff1cd1548 in _nl_load_domain.cold.0 () at /usr/lib/libc.so.6
#3  0x00007ffff1cdf396 in  () at /usr/lib/libc.so.6
#4  0x00007fffca385bd2 in movit::ResourcePool::create_2d_texture(int, int, int) () at /usr/lib/libmovit.so.8
#5  0x00007fffca378bb8 in movit::EffectChain::render(unsigned int, std::vector<movit::EffectChain::DestinationTexture, std::allocator<movit::EffectChain::DestinationTexture> > const&, unsigned int, unsigned int, unsigned int, unsigned int) () at /usr/lib/libmovit.so.8
#6  0x00007fffca379b76 in movit::EffectChain::render_to_fbo(unsigned int, unsigned int, unsigned int) () at /usr/lib/libmovit.so.8
#7  0x00007fffcebf5d45 in GlslManager::render_frame_rgba(movit::EffectChain*, mlt_frame_s*, int, int, unsigned char**) () at /usr/lib/mlt/libmltopengl.so
#8  0x00007fffcebf8bce in  () at /usr/lib/mlt/libmltopengl.so
#9  0x00007ffff6c92ac3 in mlt_frame_get_image () at /usr/lib/libmlt.so.6
#10 0x00007fffc9fb4cf5 in  () at /usr/lib/mlt/libmltqt.so
#11 0x00007ffff6c92a62 in mlt_frame_get_image () at /usr/lib/libmlt.so.6
#12 0x00007ffff6ca6122 in  () at /usr/lib/libmlt.so.6
#13 0x0000555555b69595 in RenderThread::run() (this=0x7fff84000b90) at /home/frd/kdenlive/kdenlive/src/monitor/glwidget.cpp:1501
#14 0x00007ffff2276f65 in  () at /usr/lib/libQt5Core.so.5
#15 0x00007ffff12f2a9d in start_thread () at /usr/lib/libpthread.so.0
#16 0x00007ffff1daab23 in clone () at /usr/lib/libc.so.6
~~~
