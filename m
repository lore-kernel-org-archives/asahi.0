Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF0B7FE
	for <asahi@lists.linux.dev>; Mon,  4 Sep 2023 05:39:41 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4e6so1318944a12.0
        for <asahi@lists.linux.dev>; Sun, 03 Sep 2023 22:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693805979; x=1694410779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QR4nA0JyqPQMjFdDb7AK/DSafXKdyLEiucd44/P+RY=;
        b=GlR9EVQX9/BkV/pQpwDmxbRkGiLypahMmBQKXIzePj/JkgMRTvdPi+eh52kBCRc3A6
         KkOvlt4CNDATcA1g8Ri4YItBJ0eXfmNzzKDI/JOtMViUx625aIXwvTer9e5p7uF70HKE
         XwmJ+bDaK7inDdpA8c3JvpSceL2KTZPoOegvSWocq7clpZ9816hjD5IuqDuFTUs3voM3
         7CkIO9W1aduFlIqAIYwK5VA42cBC4OIKNJAJBfLRd3x7xKx05SCWYYpv5Nm6uZKKj7Bu
         6+JH2/HjYx5mNL9+poIHtlLk19Q3kVHST11jm6NiXh3LPxwzOFTW7Yoawd4FNHPXt9mK
         o26g==
X-Gm-Message-State: AOJu0YyfjtEFeoAEPijUSoqXghMuEm/G1puRBuhyH64+RRrT9jYZEwQI
	Quc+nHBPsc8UkS+9rthkub1u4nI9eQa54Q==
X-Google-Smtp-Source: AGHT+IFQgaHTmcIEiBfUZjMjEsoCvA8QqY+Q0XpXcFCCrPUuzRfN55sxualfvQ9kD9NpEBiNb5j4wg==
X-Received: by 2002:a17:906:3116:b0:9a1:b5fc:8c56 with SMTP id 22-20020a170906311600b009a1b5fc8c56mr5778784ejx.55.1693805978235;
        Sun, 03 Sep 2023 22:39:38 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id k23-20020a1709061c1700b00992b71d8f19sm5611983ejg.133.2023.09.03.22.39.37
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 22:39:37 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-52713d2c606so1306881a12.2
        for <asahi@lists.linux.dev>; Sun, 03 Sep 2023 22:39:37 -0700 (PDT)
X-Received: by 2002:aa7:da17:0:b0:522:560d:d691 with SMTP id
 r23-20020aa7da17000000b00522560dd691mr6257518eds.25.1693805977325; Sun, 03
 Sep 2023 22:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230828170013.75820-1-povik+lin@cutebit.org> <20230828170013.75820-3-povik+lin@cutebit.org>
In-Reply-To: <20230828170013.75820-3-povik+lin@cutebit.org>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 4 Sep 2023 01:39:00 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-4R45kKzj7qUUqJJ6r4s6GS-NyVVFrBBgT134wjJ5CRw@mail.gmail.com>
Message-ID: <CAEg-Je-4R45kKzj7qUUqJJ6r4s6GS-NyVVFrBBgT134wjJ5CRw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dmaengine: apple-sio: Add Apple SIO driver
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	asahi@lists.linux.dev, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 1:00=E2=80=AFPM Martin Povi=C5=A1er <povik+lin@cute=
bit.org> wrote:
>
> Add a dmaengine driver for the Apple SIO coprocessor found on Apple
> SoCs where it provides DMA services. Have the driver support cyclic
> transactions so that ALSA drivers can rely on it in audio output to
> HDMI and DisplayPort.
>
> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> ---
>  MAINTAINERS             |   2 +
>  drivers/dma/Kconfig     |  11 +
>  drivers/dma/Makefile    |   1 +
>  drivers/dma/apple-sio.c | 868 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 882 insertions(+)
>  create mode 100644 drivers/dma/apple-sio.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3be1bdfe8ecc..e65cf3d535ef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1865,7 +1865,9 @@ M:        Martin Povi=C5=A1er <povik+lin@cutebit.or=
g>
>  L:     asahi@lists.linux.dev
>  L:     alsa-devel@alsa-project.org (moderated for non-subscribers)
>  S:     Maintained
> +F:     Documentation/devicetree/bindings/dma/apple,sio.yaml
>  F:     Documentation/devicetree/bindings/sound/apple,*
> +F:     drivers/dma/apple-sio.c
>  F:     sound/soc/apple/*
>  F:     sound/soc/codecs/cs42l83-i2c.c
>
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index f52d36e713f3..6e385dee2d3d 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -89,10 +89,21 @@ config APPLE_ADMAC
>         tristate "Apple ADMAC support"
>         depends on ARCH_APPLE || COMPILE_TEST
>         select DMA_ENGINE
> +       select DMA_VIRTUAL_CHANNELS
>         default ARCH_APPLE
>         help
>           Enable support for Audio DMA Controller found on Apple Silicon =
SoCs.
>
> +config APPLE_SIO
> +       tristate "Apple SIO support"
> +       depends on ARCH_APPLE || COMPILE_TEST
> +       depends on APPLE_RTKIT
> +       select DMA_ENGINE
> +       default ARCH_APPLE
> +       help
> +         Enable support for the SIO coprocessor found on Apple Silicon S=
oCs
> +         where it provides DMA services.
> +
>  config AT_HDMAC
>         tristate "Atmel AHB DMA support"
>         depends on ARCH_AT91
> diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> index 83553a97a010..787583ff2d45 100644
> --- a/drivers/dma/Makefile
> +++ b/drivers/dma/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_AMBA_PL08X) +=3D amba-pl08x.o
>  obj-$(CONFIG_AMCC_PPC440SPE_ADMA) +=3D ppc4xx/
>  obj-$(CONFIG_AMD_PTDMA) +=3D ptdma/
>  obj-$(CONFIG_APPLE_ADMAC) +=3D apple-admac.o
> +obj-$(CONFIG_APPLE_SIO) +=3D apple-sio.o
>  obj-$(CONFIG_AT_HDMAC) +=3D at_hdmac.o
>  obj-$(CONFIG_AT_XDMAC) +=3D at_xdmac.o
>  obj-$(CONFIG_AXI_DMAC) +=3D dma-axi-dmac.o
> diff --git a/drivers/dma/apple-sio.c b/drivers/dma/apple-sio.c
> new file mode 100644
> index 000000000000..e15deeded4dc
> --- /dev/null
> +++ b/drivers/dma/apple-sio.c
> @@ -0,0 +1,868 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Driver for SIO coprocessor on t8103 (M1) and other Apple SoCs
> + *
> + * Copyright (C) The Asahi Linux Contributors
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_dma.h>
> +#include <linux/soc/apple/rtkit.h>
> +
> +#include "dmaengine.h"
> +#include "virt-dma.h"
> +
> +#define NCHANNELS_MAX  0x80
> +
> +#define REG_CPU_CONTROL        0x44
> +#define CPU_CONTROL_RUN BIT(4)
> +
> +#define SIOMSG_DATA    GENMASK(63, 32)
> +#define SIOMSG_TYPE    GENMASK(23, 16)
> +#define SIOMSG_PARAM   GENMASK(31, 24)
> +#define SIOMSG_TAG     GENMASK(13, 8)
> +#define SIOMSG_EP      GENMASK(7, 0)
> +
> +#define EP_SIO         0x20
> +
> +#define MSG_START      0x2
> +#define MSG_SETUP      0x3
> +#define MSG_CONFIGURE  0x5
> +#define MSG_ISSUE      0x6
> +#define MSG_TERMINATE  0x8
> +#define MSG_ACK                0x65
> +#define MSG_NACK       0x66
> +#define MSG_STARTED    0x67
> +#define MSG_REPORT     0x68
> +
> +#define SIO_CALL_TIMEOUT_MS    100
> +#define SIO_SHMEM_SIZE         0x1000
> +#define SIO_NO_DESC_SLOTS      64
> +
> +/*
> + * There are two kinds of 'transaction descriptors' in play here.
> + *
> + * There's the struct sio_tx, and the struct dma_async_tx_descriptor emb=
edded
> + * inside, which jointly represent a transaction to the dmaengine subsys=
tem.
> + * At this time we only support those transactions to be cyclic.
> + *
> + * Then there are the coprocessor descriptors, which is what the coproce=
ssor
> + * knows and understands. These don't seem to have a cyclic regime, so w=
e can't
> + * map the dmaengine transaction on an exact coprocessor counterpart. In=
stead
> + * we continually queue up many coprocessor descriptors to implement a c=
yclic
> + * transaction.
> + *
> + * The number below is the maximum of how far ahead (how many) coprocess=
or
> + * descriptors we should be queuing up, per channel, for a cyclic transa=
ction.
> + * Basically it's a made-up number.
> + */
> +#define SIO_MAX_NINFLIGHT      4
> +
> +struct sio_coproc_desc {
> +       u32 pad1;
> +       u32 flag;
> +       u64 unk;
> +       u64 iova;
> +       u64 size;
> +       u64 pad2;
> +       u64 pad3;
> +} __packed;
> +static_assert(sizeof(struct sio_coproc_desc) =3D=3D 48);
> +
> +struct sio_shmem_chan_config {
> +       u32 datashape;
> +       u32 timeout;
> +       u32 fifo;
> +       u32 threshold;
> +       u32 limit;
> +} __packed;
> +
> +struct sio_data;
> +struct sio_tx;
> +
> +struct sio_chan {
> +       unsigned int no;
> +       struct sio_data *host;
> +       struct virt_dma_chan vc;
> +       struct work_struct terminate_wq;
> +
> +       struct sio_tx *current_tx;
> +};
> +
> +#define SIO_NTAGS              16
> +
> +typedef void (*sio_ack_callback)(struct sio_chan *, void *, bool);
> +
> +struct sio_data {
> +       void __iomem *base;
> +       struct dma_device dma;
> +       struct device *dev;
> +       struct apple_rtkit *rtk;
> +       void *shmem;
> +       struct sio_coproc_desc *shmem_desc_base;
> +       unsigned long *desc_allocated;
> +
> +       struct sio_tagdata {
> +               DECLARE_BITMAP(allocated, SIO_NTAGS);
> +               int last_tag;
> +
> +               struct completion completions[SIO_NTAGS];
> +               bool atomic[SIO_NTAGS];
> +               bool acked[SIO_NTAGS];
> +
> +               sio_ack_callback ack_callback[SIO_NTAGS];
> +               void *cookie[SIO_NTAGS];
> +       } tags;
> +
> +       int nchannels;
> +       struct sio_chan channels[];
> +};
> +
> +struct sio_tx {
> +       struct virt_dma_desc vd;
> +       struct completion done;
> +
> +       bool terminated;
> +       size_t period_len;
> +       int nperiods;
> +       int ninflight;
> +       int next;
> +
> +       struct sio_coproc_desc *siodesc[];
> +};
> +
> +static int sio_send_siomsg(struct sio_data *sio, u64 msg);
> +static int sio_send_siomsg_atomic(struct sio_data *sio, u64 msg,
> +                                 sio_ack_callback ack_callback,
> +                                 void *cookie);
> +static int sio_call(struct sio_data *sio, u64 msg);
> +
> +static struct sio_chan *to_sio_chan(struct dma_chan *chan)
> +{
> +       return container_of(chan, struct sio_chan, vc.chan);
> +}
> +
> +static struct sio_tx *to_sio_tx(struct dma_async_tx_descriptor *tx)
> +{
> +       return container_of(tx, struct sio_tx, vd.tx);
> +}
> +
> +static int sio_alloc_tag(struct sio_data *sio)
> +{
> +       struct sio_tagdata *tags =3D &sio->tags;
> +       int tag, i;
> +
> +       /*
> +        * Because tag number 0 is special, the usable tag range
> +        * is 1...(SIO_NTAGS - 1). So, to pick the next usable tag,
> +        * we do modulo (SIO_NTAGS - 1) *then* plus one.
> +        */
> +
> +#define SIO_USABLE_TAGS (SIO_NTAGS - 1)
> +       tag =3D (READ_ONCE(tags->last_tag) % SIO_USABLE_TAGS) + 1;
> +
> +       for (i =3D 0; i < SIO_USABLE_TAGS; i++) {
> +               if (!test_and_set_bit(tag, tags->allocated))
> +                       break;
> +
> +               tag =3D (tag % SIO_USABLE_TAGS) + 1;
> +       }
> +
> +       WRITE_ONCE(tags->last_tag, tag);
> +
> +       if (i < SIO_USABLE_TAGS)
> +               return tag;
> +       else
> +               return -EBUSY;
> +#undef SIO_USABLE_TAGS
> +}
> +
> +static void sio_free_tag(struct sio_data *sio, int tag)
> +{
> +       struct sio_tagdata *tags =3D &sio->tags;
> +
> +       if (WARN_ON(tag >=3D SIO_NTAGS))
> +               return;
> +
> +       tags->atomic[tag] =3D false;
> +       tags->ack_callback[tag] =3D NULL;
> +
> +       WARN_ON(!test_and_clear_bit(tag, tags->allocated));
> +}
> +
> +static void sio_set_tag_atomic(struct sio_data *sio, int tag,
> +                              sio_ack_callback ack_callback,
> +                              void *cookie)
> +{
> +       struct sio_tagdata *tags =3D &sio->tags;
> +
> +       tags->atomic[tag] =3D true;
> +       tags->ack_callback[tag] =3D ack_callback;
> +       tags->cookie[tag] =3D cookie;
> +}
> +
> +static struct sio_coproc_desc *sio_alloc_desc(struct sio_data *sio)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < SIO_NO_DESC_SLOTS; i++)
> +               if (!test_and_set_bit(i, sio->desc_allocated))
> +                       return sio->shmem_desc_base + i;
> +
> +       return NULL;
> +}
> +
> +static void sio_free_desc(struct sio_data *sio, struct sio_coproc_desc *=
desc)
> +{
> +       clear_bit(desc - sio->shmem_desc_base, sio->desc_allocated);
> +}
> +
> +static int sio_coproc_desc_slot(struct sio_data *sio, struct sio_coproc_=
desc *desc)
> +{
> +       return (desc - sio->shmem_desc_base) * 4;
> +}
> +
> +static enum dma_transfer_direction sio_chan_direction(int channo)
> +{
> +       /* Channel directions are fixed based on channel number */
> +       return (channo & 1) ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
> +}
> +
> +static void sio_tx_free(struct virt_dma_desc *vd)
> +{
> +       struct sio_data *sio =3D to_sio_chan(vd->tx.chan)->host;
> +       struct sio_tx *siotx =3D to_sio_tx(&vd->tx);
> +       int i;
> +
> +       for (i =3D 0; i < siotx->nperiods; i++)
> +               if (siotx->siodesc[i])
> +                       sio_free_desc(sio, siotx->siodesc[i]);
> +       kfree(siotx);
> +}
> +
> +static struct dma_async_tx_descriptor *sio_prep_dma_cyclic(
> +               struct dma_chan *chan, dma_addr_t buf_addr, size_t buf_le=
n,
> +               size_t period_len, enum dma_transfer_direction direction,
> +               unsigned long flags)
> +{
> +       struct sio_chan *siochan =3D to_sio_chan(chan);
> +       struct sio_tx *siotx =3D NULL;
> +       int i, nperiods =3D buf_len / period_len;
> +
> +       if (direction !=3D sio_chan_direction(siochan->no))
> +               return NULL;
> +
> +       siotx =3D kzalloc(struct_size(siotx, siodesc, nperiods), GFP_NOWA=
IT);
> +       if (!siotx)
> +               return NULL;
> +
> +       init_completion(&siotx->done);
> +       siotx->period_len =3D period_len;
> +       siotx->nperiods =3D nperiods;
> +
> +       for (i =3D 0; i < nperiods; i++) {
> +               struct sio_coproc_desc *d;
> +
> +               siotx->siodesc[i] =3D d =3D sio_alloc_desc(siochan->host)=
;
> +               if (!d) {
> +                       sio_tx_free(&siotx->vd);
> +                       return NULL;
> +               }
> +
> +               d->flag =3D 1; // not sure what's up with this
> +               d->iova =3D buf_addr + period_len * i;
> +               d->size =3D period_len;
> +       }
> +       dma_wmb();
> +
> +       return vchan_tx_prep(&siochan->vc, &siotx->vd, flags);
> +}
> +
> +static enum dma_status sio_tx_status(struct dma_chan *chan, dma_cookie_t=
 cookie,
> +                                    struct dma_tx_state *txstate)
> +{
> +       struct sio_chan *siochan =3D to_sio_chan(chan);
> +       struct virt_dma_desc *vd;
> +       struct sio_tx *siotx;
> +       enum dma_status ret;
> +       unsigned long flags;
> +       int periods_residue;
> +       size_t residue;
> +
> +       ret =3D dma_cookie_status(chan, cookie, txstate);
> +       if (ret =3D=3D DMA_COMPLETE || !txstate)
> +               return ret;
> +
> +       spin_lock_irqsave(&siochan->vc.lock, flags);
> +       siotx =3D siochan->current_tx;
> +
> +       if (siotx && siotx->vd.tx.cookie =3D=3D cookie) {
> +               ret =3D DMA_IN_PROGRESS;
> +               periods_residue =3D siotx->next - siotx->ninflight;
> +               while (periods_residue < 0)
> +                       periods_residue +=3D siotx->nperiods;
> +               residue =3D (siotx->nperiods - periods_residue) * siotx->=
period_len;
> +       } else {
> +               ret =3D DMA_IN_PROGRESS;
> +               residue =3D 0;
> +               vd =3D vchan_find_desc(&siochan->vc, cookie);
> +               if (vd) {
> +                       siotx =3D to_sio_tx(&vd->tx);
> +                       residue =3D siotx->period_len * siotx->nperiods;
> +               }
> +       }
> +       spin_unlock_irqrestore(&siochan->vc.lock, flags);
> +       dma_set_residue(txstate, residue);
> +
> +       return ret;
> +}
> +
> +static bool sio_fill_in_locked(struct sio_chan *siochan);
> +
> +static void sio_handle_issue_ack(struct sio_chan *siochan, void *cookie,=
 bool ok)
> +{
> +       unsigned long flags;
> +       dma_cookie_t tx_cookie =3D (unsigned long) cookie;
> +       struct sio_tx *tx;
> +
> +       if (!ok) {
> +               dev_err(siochan->host->dev, "nacked issue on chan %d\n", =
siochan->no);
> +               return;
> +       }
> +
> +       spin_lock_irqsave(&siochan->vc.lock, flags);
> +       if (!siochan->current_tx || tx_cookie !=3D siochan->current_tx->v=
d.tx.cookie ||
> +                       siochan->current_tx->terminated)
> +               goto out;
> +
> +       tx =3D siochan->current_tx;
> +       tx->next =3D (tx->next + 1) % tx->nperiods;
> +       tx->ninflight++;
> +       sio_fill_in_locked(siochan);
> +
> +out:
> +       spin_unlock_irqrestore(&siochan->vc.lock, flags);
> +}
> +
> +static bool sio_fill_in_locked(struct sio_chan *siochan)
> +{
> +       struct sio_data *sio =3D siochan->host;
> +       struct sio_tx *tx =3D siochan->current_tx;
> +       struct sio_coproc_desc *d =3D tx->siodesc[tx->next];
> +       int ret;
> +
> +       if (tx->ninflight >=3D SIO_MAX_NINFLIGHT || tx->terminated)
> +               return false;
> +
> +       static_assert(sizeof(dma_cookie_t) <=3D sizeof(void *));
> +       ret =3D sio_send_siomsg_atomic(sio, FIELD_PREP(SIOMSG_EP, siochan=
->no) |
> +                                    FIELD_PREP(SIOMSG_TYPE, MSG_ISSUE) |
> +                                    FIELD_PREP(SIOMSG_DATA, sio_coproc_d=
esc_slot(sio, d)),
> +                                    sio_handle_issue_ack, (void *) (uint=
ptr_t) tx->vd.tx.cookie);
> +       if (ret < 0)
> +               dev_err_ratelimited(sio->dev, "can't issue on chan %d nin=
flight %d: %d\n",
> +                                   siochan->no, tx->ninflight, ret);
> +       return true;
> +}
> +
> +static void sio_update_current_tx_locked(struct sio_chan *siochan)
> +{
> +       struct virt_dma_desc *vd =3D vchan_next_desc(&siochan->vc);
> +
> +       if (vd && !siochan->current_tx) {
> +               list_del(&vd->node);
> +               siochan->current_tx =3D to_sio_tx(&vd->tx);
> +               sio_fill_in_locked(siochan);
> +       }
> +}
> +
> +static void sio_issue_pending(struct dma_chan *chan)
> +{
> +       struct sio_chan *siochan =3D to_sio_chan(chan);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&siochan->vc.lock, flags);
> +       vchan_issue_pending(&siochan->vc);
> +       sio_update_current_tx_locked(siochan);
> +       spin_unlock_irqrestore(&siochan->vc.lock, flags);
> +}
> +
> +static int sio_terminate_all(struct dma_chan *chan)
> +{
> +       struct sio_chan *siochan =3D to_sio_chan(chan);
> +       unsigned long flags;
> +       LIST_HEAD(to_free);
> +
> +       spin_lock_irqsave(&siochan->vc.lock, flags);
> +       if (siochan->current_tx && !siochan->current_tx->terminated) {
> +               dma_cookie_complete(&siochan->current_tx->vd.tx);
> +               siochan->current_tx->terminated =3D true;
> +               schedule_work(&siochan->terminate_wq);
> +       }
> +       vchan_get_all_descriptors(&siochan->vc, &to_free);
> +       spin_unlock_irqrestore(&siochan->vc.lock, flags);
> +
> +       vchan_dma_desc_free_list(&siochan->vc, &to_free);
> +
> +       return 0;
> +}
> +
> +static void sio_terminate_work(struct work_struct *wq)
> +{
> +       struct sio_chan *siochan =3D container_of(wq, struct sio_chan, te=
rminate_wq);
> +       struct sio_tx *tx;
> +       unsigned long flags;
> +       int ret;
> +
> +       spin_lock_irqsave(&siochan->vc.lock, flags);
> +       tx =3D siochan->current_tx;
> +       spin_unlock_irqrestore(&siochan->vc.lock, flags);
> +
> +       if (WARN_ON(!tx))
> +               return;
> +
> +       ret =3D sio_call(siochan->host, FIELD_PREP(SIOMSG_EP, siochan->no=
) |
> +                                     FIELD_PREP(SIOMSG_TYPE, MSG_TERMINA=
TE));
> +       if (ret < 0)
> +               dev_err(siochan->host->dev, "terminate call on chan %d fa=
iled: %d\n",
> +                       siochan->no, ret);
> +
> +       ret =3D wait_for_completion_timeout(&tx->done, msecs_to_jiffies(5=
00));
> +       if (!ret)
> +               dev_err(siochan->host->dev, "terminate descriptor wait ti=
med out\n");
> +
> +       tasklet_kill(&siochan->vc.task);
> +
> +       spin_lock_irqsave(&siochan->vc.lock, flags);
> +       WARN_ON(siochan->current_tx !=3D tx);
> +       siochan->current_tx =3D NULL;
> +       sio_update_current_tx_locked(siochan);
> +       spin_unlock_irqrestore(&siochan->vc.lock, flags);
> +
> +       sio_tx_free(&tx->vd);
> +}
> +
> +static void sio_synchronize(struct dma_chan *chan)
> +{
> +       struct sio_chan *siochan =3D to_sio_chan(chan);
> +
> +       flush_work(&siochan->terminate_wq);
> +}
> +
> +static void sio_free_chan_resources(struct dma_chan *chan)
> +{
> +       sio_terminate_all(chan);
> +       sio_synchronize(chan);
> +       vchan_free_chan_resources(&to_sio_chan(chan)->vc);
> +}
> +
> +static struct dma_chan *sio_dma_of_xlate(struct of_phandle_args *dma_spe=
c,
> +                                        struct of_dma *ofdma)
> +{
> +       struct sio_data *sio =3D (struct sio_data *) ofdma->of_dma_data;
> +       unsigned int index =3D dma_spec->args[0];
> +
> +       if (dma_spec->args_count !=3D 1 || index >=3D sio->nchannels)
> +               return ERR_PTR(-EINVAL);
> +
> +       return dma_get_slave_channel(&sio->channels[index].vc.chan);
> +}
> +
> +static void sio_rtk_crashed(void *cookie)
> +{
> +       struct sio_data *sio =3D cookie;
> +
> +       dev_err(sio->dev, "SIO down (crashed)");
> +}
> +
> +static void sio_process_report(struct sio_chan *siochan)
> +{
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&siochan->vc.lock, flags);
> +       if (siochan->current_tx) {
> +               struct sio_tx *tx =3D siochan->current_tx;
> +
> +               if (tx->ninflight)
> +                       tx->ninflight--;
> +               vchan_cyclic_callback(&tx->vd);
> +               if (!sio_fill_in_locked(siochan) && !tx->ninflight)
> +                       complete(&tx->done);
> +       }
> +       spin_unlock_irqrestore(&siochan->vc.lock, flags);
> +}
> +
> +static void sio_recv_msg(void *cookie, u8 ep, u64 msg)
> +{
> +       struct sio_data *sio =3D cookie;
> +       struct sio_tagdata *tags =3D &sio->tags;
> +       u32 data;
> +       u8 param, type, tag, sioep;
> +
> +       if (ep !=3D EP_SIO)
> +               goto unknown;
> +
> +       data  =3D FIELD_GET(SIOMSG_DATA, msg);
> +       param =3D FIELD_GET(SIOMSG_PARAM, msg);
> +       type  =3D FIELD_GET(SIOMSG_TYPE, msg);
> +       tag   =3D FIELD_GET(SIOMSG_TAG, msg);
> +       sioep =3D FIELD_GET(SIOMSG_EP, msg);
> +
> +       switch (type) {
> +       case MSG_STARTED:
> +               dev_info(sio->dev, "SIO protocol v%u\n", data);
> +               type =3D MSG_ACK; /* Pretend this is an ACK */
> +               fallthrough;
> +       case MSG_ACK:
> +       case MSG_NACK:
> +               if (WARN_ON(tag >=3D SIO_NTAGS))
> +                       break;
> +
> +               if (tags->atomic[tag]) {
> +                       sio_ack_callback callback =3D tags->ack_callback[=
tag];
> +
> +                       if (callback && !WARN_ON(sioep >=3D sio->nchannel=
s))
> +                               callback(&sio->channels[sioep],
> +                                        tags->cookie[tag], type =3D=3D M=
SG_ACK);
> +                       if (type =3D=3D MSG_NACK)
> +                               dev_err(sio->dev, "got a NACK on channel =
%d\n", sioep);
> +                       sio_free_tag(sio, tag);
> +               } else {
> +                       tags->acked[tag] =3D (type =3D=3D MSG_ACK);
> +                       complete(&tags->completions[tag]);
> +               }
> +               break;
> +
> +       case MSG_REPORT:
> +               if (WARN_ON(sioep >=3D sio->nchannels))
> +                       break;
> +
> +               sio_process_report(&sio->channels[sioep]);
> +               break;
> +
> +       default:
> +               goto unknown;
> +       }
> +       return;
> +
> +unknown:
> +       dev_warn(sio->dev, "received unknown message: ep %x data %016llx\=
n",
> +                ep, msg);
> +}
> +
> +static int _sio_send_siomsg(struct sio_data *sio, u64 msg, bool atomic,
> +                           sio_ack_callback ack_callback, void *cookie)
> +{
> +       int tag, ret;
> +
> +       tag =3D sio_alloc_tag(sio);
> +       if (tag < 0)
> +               return tag;
> +
> +       if (atomic)
> +               sio_set_tag_atomic(sio, tag, ack_callback, cookie);
> +       else
> +               reinit_completion(&sio->tags.completions[tag]);
> +
> +       msg &=3D ~SIOMSG_TAG;
> +       msg |=3D FIELD_PREP(SIOMSG_TAG, tag);
> +       ret =3D apple_rtkit_send_message(sio->rtk, EP_SIO, msg, NULL,
> +                                      atomic);
> +       if (ret < 0) {
> +               sio_free_tag(sio, tag);
> +               return ret;
> +       }
> +
> +       return tag;
> +}
> +
> +static int sio_send_siomsg(struct sio_data *sio, u64 msg)
> +{
> +       return _sio_send_siomsg(sio, msg, false, NULL, NULL);
> +}
> +
> +static int sio_send_siomsg_atomic(struct sio_data *sio, u64 msg,
> +                                 sio_ack_callback ack_callback,
> +                                 void *cookie)
> +{
> +       return _sio_send_siomsg(sio, msg, true, ack_callback, cookie);
> +}
> +
> +static int sio_call(struct sio_data *sio, u64 msg)
> +{
> +       int tag, ret;
> +
> +       tag =3D sio_send_siomsg(sio, msg);
> +       if (tag < 0)
> +               return tag;
> +
> +       ret =3D wait_for_completion_timeout(&sio->tags.completions[tag],
> +                                         msecs_to_jiffies(SIO_CALL_TIMEO=
UT_MS));
> +       if (!ret) {
> +               dev_warn(sio->dev, "call %8x timed out\n", msg);
> +               sio_free_tag(sio, tag);
> +               return -ETIME;
> +       }
> +
> +       ret =3D sio->tags.acked[tag];
> +       sio_free_tag(sio, tag);
> +
> +       return ret;
> +}
> +
> +static const struct apple_rtkit_ops sio_rtkit_ops =3D {
> +       .crashed =3D sio_rtk_crashed,
> +       .recv_message =3D sio_recv_msg,
> +};
> +
> +static int sio_device_config(struct dma_chan *chan,
> +                            struct dma_slave_config *config)
> +{
> +       struct sio_chan *siochan =3D to_sio_chan(chan);
> +       struct sio_data *sio =3D siochan->host;
> +       bool is_tx =3D sio_chan_direction(siochan->no) =3D=3D DMA_MEM_TO_=
DEV;
> +       struct sio_shmem_chan_config *cfg =3D sio->shmem;
> +       int ret;
> +
> +       switch (is_tx ? config->dst_addr_width : config->src_addr_width) =
{
> +       case DMA_SLAVE_BUSWIDTH_1_BYTE:
> +               cfg->datashape =3D 0;
> +               break;
> +       case DMA_SLAVE_BUSWIDTH_2_BYTES:
> +               cfg->datashape =3D 1;
> +               break;
> +       case DMA_SLAVE_BUSWIDTH_4_BYTES:
> +               cfg->datashape =3D 2;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       cfg->fifo =3D 0x800;
> +       cfg->limit =3D 0x800;
> +       cfg->threshold =3D 0x800;
> +       dma_wmb();
> +
> +       ret =3D sio_call(sio, FIELD_PREP(SIOMSG_TYPE, MSG_CONFIGURE) |
> +                           FIELD_PREP(SIOMSG_EP, siochan->no));
> +
> +       if (ret =3D=3D 1)
> +               ret =3D 0;
> +       else if (ret =3D=3D 0)
> +               ret =3D -EINVAL;
> +       return ret;
> +}
> +
> +static int sio_alloc_shmem(struct sio_data *sio)
> +{
> +       dma_addr_t iova;
> +       int err;
> +
> +       sio->shmem =3D dma_alloc_coherent(sio->dev, SIO_SHMEM_SIZE,
> +                                       &iova, GFP_KERNEL);
> +       if (!sio->shmem)
> +               return -ENOMEM;
> +
> +       sio->shmem_desc_base =3D (struct sio_coproc_desc *) (sio->shmem +=
 56);
> +       sio->desc_allocated =3D devm_kzalloc(sio->dev, SIO_NO_DESC_SLOTS =
/ 32,
> +                                          GFP_KERNEL);
> +       if (!sio->desc_allocated)
> +               return -ENOMEM;
> +
> +       err =3D sio_call(sio, FIELD_PREP(SIOMSG_TYPE, MSG_SETUP) |
> +                           FIELD_PREP(SIOMSG_PARAM, 1) |
> +                           FIELD_PREP(SIOMSG_DATA, iova >> 12));
> +       if (err !=3D 1) {
> +               if (err =3D=3D 0)
> +                       err =3D -EINVAL;
> +               return err;
> +       }
> +
> +       err =3D sio_call(sio, FIELD_PREP(SIOMSG_TYPE, MSG_SETUP) |
> +                           FIELD_PREP(SIOMSG_PARAM, 2) |
> +                           FIELD_PREP(SIOMSG_DATA, SIO_SHMEM_SIZE));
> +       if (err !=3D 1) {
> +               if (err =3D=3D 0)
> +                       err =3D -EINVAL;
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static int sio_send_dt_params(struct sio_data *sio)
> +{
> +       struct device_node *np =3D sio->dev->of_node;
> +       const char *propname =3D "apple,sio-firmware-params";
> +       int nparams, err, i;
> +
> +       nparams =3D of_property_count_u32_elems(np, propname);
> +       if (nparams < 0) {
> +               err =3D nparams;
> +               goto badprop;
> +       }
> +
> +       for (i =3D 0; i < nparams / 2; i++) {
> +               u32 key, val;
> +
> +               err =3D of_property_read_u32_index(np, propname, 2 * i, &=
key);
> +               if (err)
> +                       goto badprop;
> +               err =3D of_property_read_u32_index(np, propname, 2 * i + =
1, &val);
> +               if (err)
> +                       goto badprop;
> +
> +               err =3D sio_call(sio, FIELD_PREP(SIOMSG_TYPE, MSG_SETUP) =
|
> +                                   FIELD_PREP(SIOMSG_PARAM, key & 0xff) =
|
> +                                   FIELD_PREP(SIOMSG_EP, key >> 8) |
> +                                   FIELD_PREP(SIOMSG_DATA, val));
> +               if (err < 1) {
> +                       if (err =3D=3D 0)
> +                               err =3D -ENXIO;
> +                       return dev_err_probe(sio->dev, err, "sending SIO =
parameter %#x value %#x\n",
> +                                            key, val);
> +               }
> +       }
> +
> +       return 0;
> +
> +badprop:
> +       return dev_err_probe(sio->dev, err, "failed to read '%s'\n", prop=
name);
> +}
> +
> +static int sio_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np =3D pdev->dev.of_node;
> +       struct sio_data *sio;
> +       struct dma_device *dma;
> +       int nchannels;
> +       int err, i;
> +
> +       err =3D of_property_read_u32(np, "dma-channels", &nchannels);
> +       if (err || nchannels > NCHANNELS_MAX)
> +               return dev_err_probe(&pdev->dev, -EINVAL,
> +                                    "missing or invalid dma-channels pro=
perty\n");
> +
> +       sio =3D devm_kzalloc(&pdev->dev, struct_size(sio, channels, nchan=
nels), GFP_KERNEL);
> +       if (!sio)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, sio);
> +       sio->dev =3D &pdev->dev;
> +       sio->nchannels =3D nchannels;
> +
> +       sio->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(sio->base))
> +               return PTR_ERR(sio->base);
> +
> +       sio->rtk =3D devm_apple_rtkit_init(&pdev->dev, sio, NULL, 0, &sio=
_rtkit_ops);
> +       if (IS_ERR(sio->rtk))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(sio->rtk),
> +                                    "couldn't initialize rtkit\n");
> +       for (i =3D 1; i < SIO_NTAGS; i++)
> +               init_completion(&sio->tags.completions[i]);
> +
> +       dma =3D &sio->dma;
> +       dma_cap_set(DMA_PRIVATE, dma->cap_mask);
> +       dma_cap_set(DMA_CYCLIC, dma->cap_mask);
> +
> +       dma->dev =3D &pdev->dev;
> +       dma->device_free_chan_resources =3D sio_free_chan_resources;
> +       dma->device_tx_status =3D sio_tx_status;
> +       dma->device_issue_pending =3D sio_issue_pending;
> +       dma->device_terminate_all =3D sio_terminate_all;
> +       dma->device_synchronize =3D sio_synchronize;
> +       dma->device_prep_dma_cyclic =3D sio_prep_dma_cyclic;
> +       dma->device_config =3D sio_device_config;
> +
> +       dma->directions =3D BIT(DMA_MEM_TO_DEV);
> +       dma->residue_granularity =3D DMA_RESIDUE_GRANULARITY_SEGMENT;
> +       dma->dst_addr_widths =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
> +                              BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> +                              BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
> +
> +       INIT_LIST_HEAD(&dma->channels);
> +       for (i =3D 0; i < nchannels; i++) {
> +               struct sio_chan *siochan =3D &sio->channels[i];
> +
> +               siochan->host =3D sio;
> +               siochan->no =3D i;
> +               siochan->vc.desc_free =3D sio_tx_free;
> +               INIT_WORK(&siochan->terminate_wq, sio_terminate_work);
> +               vchan_init(&siochan->vc, dma);
> +       }
> +
> +       writel(CPU_CONTROL_RUN, sio->base + REG_CPU_CONTROL);
> +
> +       err =3D apple_rtkit_boot(sio->rtk);
> +       if (err)
> +               return dev_err_probe(&pdev->dev, err, "SIO did not boot\n=
");
> +
> +       err =3D apple_rtkit_start_ep(sio->rtk, EP_SIO);
> +       if (err)
> +               return dev_err_probe(&pdev->dev, err, "starting SIO endpo=
int\n");
> +
> +       err =3D sio_call(sio, FIELD_PREP(SIOMSG_TYPE, MSG_START));
> +       if (err < 1) {
> +               if (err =3D=3D 0)
> +                       err =3D -ENXIO;
> +               return dev_err_probe(&pdev->dev, err, "starting SIO servi=
ce\n");
> +       }
> +
> +       err =3D sio_send_dt_params(sio);
> +       if (err < 0)
> +               return dev_err_probe(&pdev->dev, err, "failed to send boo=
t-up parameters\n");
> +
> +       err =3D sio_alloc_shmem(sio);
> +       if (err < 0)
> +               return err;
> +
> +       err =3D dma_async_device_register(&sio->dma);
> +       if (err)
> +               return dev_err_probe(&pdev->dev, err, "failed to register=
 DMA device\n");
> +
> +       err =3D of_dma_controller_register(pdev->dev.of_node, sio_dma_of_=
xlate, sio);
> +       if (err) {
> +               dma_async_device_unregister(&sio->dma);
> +               return dev_err_probe(&pdev->dev, err, "failed to register=
 with OF\n");
> +       }
> +
> +       return 0;
> +}
> +
> +static int sio_remove(struct platform_device *pdev)
> +{
> +       struct sio_data *sio =3D platform_get_drvdata(pdev);
> +
> +       of_dma_controller_free(pdev->dev.of_node);
> +       dma_async_device_unregister(&sio->dma);
> +       return 0;
> +}
> +
> +static const struct of_device_id sio_of_match[] =3D {
> +       { .compatible =3D "apple,sio", },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, sio_of_match);
> +
> +static struct platform_driver apple_sio_driver =3D {
> +       .driver =3D {
> +               .name =3D "apple-sio",
> +               .of_match_table =3D sio_of_match,
> +       },
> +       .probe =3D sio_probe,
> +       .remove =3D sio_remove,
> +};
> +module_platform_driver(apple_sio_driver);
> +
> +MODULE_AUTHOR("Martin Povi=C5=A1er <povik+lin@cutebit.org>");
> +MODULE_DESCRIPTION("Driver for SIO coprocessor on Apple SoCs");
> +MODULE_LICENSE("Dual MIT/GPL");
> --
> 2.38.3
>
>

The code looks reasonably okay to me, so...

Acked-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
