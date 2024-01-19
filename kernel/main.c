#include <stdint.h>
#include <stddef.h>
#include <limine.h>

#define asm __asm__

LIMINE_BASE_REVISION(1)

struct limine_framebuffer_request fb_req = {
  .id = LIMINE_FRAMEBUFFER_REQUEST,
  .revision = 0,
};

static void
halt()
{
  asm ("cli");
  for (;;) {
    asm ("hlt");
  }
}

void
_start(void)
{
  if (LIMINE_BASE_REVISION_SUPPORTED == 0) {
    halt();
  }

  if (fb_req.response == NULL || fb_req.response->framebuffer_count < 1) {
    halt();
  }

  struct limine_framebuffer *fb = fb_req.response->framebuffers[0];

  for (size_t i = 0; i < 100; i++) {
    uint32_t *fb_ptr = fb->address;
    fb_ptr[i * (fb->pitch / 4) + i] = 0xffffff;
  }

  halt();
}
