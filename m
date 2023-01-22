Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3CA1367
	for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 12:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674389779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rXwZ5IpRiYOpk4BxqOLDiJBQ1xame8DGBmk28ubnqrM=;
	b=EOxMFGRJxQS23LUEbd53cuVgp9Ci8F14jZ2Qs6RNQIkPM5jf1Om1iZg3kxXbxmTxkw6oQm
	c6QGTObQHcHd9zonRHJR9vNXiehUxoimyYaPs6brTHOjJVe3UoBKCU7/RgisFxQNGTQEgz
	izvVsD6I9Jj0d9yiYkUmJZmPM3w03ec=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-530-pUQnspzCO_WVbsgwgIAlVA-1; Sun, 22 Jan 2023 07:16:17 -0500
X-MC-Unique: pUQnspzCO_WVbsgwgIAlVA-1
Received: by mail-vk1-f197.google.com with SMTP id w13-20020a1f300d000000b003e17082aab9so3736652vkw.4
        for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 04:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXwZ5IpRiYOpk4BxqOLDiJBQ1xame8DGBmk28ubnqrM=;
        b=hycc5tnKPzRtZdHSJym+M+ob9so3G65pd0nVQ2evT5OIbQ10AE7c6yikT3XgGc/Ryn
         LN/0KaNqmiBgYQ/tfPnfW1nhCyGKCgOy9hGLaXqZaUZOkZe+4nloQqZH7nyjtpMc0VBS
         fmwQdl+5kDwWpFWSANQectOqgWp39LMZTm9TgNQD9wjpdPA+0TvbOg4uFU08m7Xlq6c+
         SAh7T/6fjSfOraDufFTWdcCii30Gl9fDlV79HofuggGzBO/+3PTt1YWrjizLFMOcP0Ie
         zJcmoeGYEp4q98QDAtHhOdWNKS214DxKJNxPE5bbxpB0bPBPc9V8XeJ+Uu3puTYbF17g
         SzZw==
X-Gm-Message-State: AFqh2kqqvEscuKmBdbzBVjoQZNOiMDkjFUp0dTGXPAEtxA1sk95+y75C
	+6C5FKsGUSapXsQ6WlUsNkyX+h4mtwGfxkLOPMQ5SxWBse4deRrHdAaAj5LwOlyB2fM6AQcKze8
	GHEkjSWoReRMjsm0P8A862+ZbVWN1/5M=
X-Received: by 2002:a67:e992:0:b0:3d2:e26a:d76f with SMTP id b18-20020a67e992000000b003d2e26ad76fmr2567176vso.41.1674389776840;
        Sun, 22 Jan 2023 04:16:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt8RUTbUD2yYmQlhCh6ICsxMQJZgQco/EAGYx4CajKySDnAqSNvz1kUZi1oL2Ez+ij8lioHGTWMAHPAEv1502o=
X-Received: by 2002:a67:e992:0:b0:3d2:e26a:d76f with SMTP id
 b18-20020a67e992000000b003d2e26ad76fmr2567173vso.41.1674389776614; Sun, 22
 Jan 2023 04:16:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230121073741.3807-1-lina@asahilina.net>
In-Reply-To: <20230121073741.3807-1-lina@asahilina.net>
From: Eric Curtin <ecurtin@redhat.com>
Date: Sun, 22 Jan 2023 12:16:00 +0000
Message-ID: <CAOgh=FxN=5dvxvUm=Fj-6hVuieN6GFnfG96F9c9=td6B8OvP3g@mail.gmail.com>
Subject: Re: [PATCH] soc: apple: rtkit: Add register dump decoding to crashlog
To: Asahi Lina <lina@asahilina.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Jan 2023 at 07:48, Asahi Lina <lina@asahilina.net> wrote:
>
> When the coprocessor crashes, it's useful to get a proper register dump
> so we can find out what the firmware was doing. Add a decoder for this.
>
> Originally this had ESR decoding by reusing the ARM64 arch header for
> this, but that introduces some module linking and cross-arch compilation
> issues, so let's leave that out for now.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Signed-off-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

>  drivers/soc/apple/rtkit-crashlog.c | 83 ++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>
> diff --git a/drivers/soc/apple/rtkit-crashlog.c b/drivers/soc/apple/rtkit-crashlog.c
> index 732deed64660..e29ef0a80ab8 100644
> --- a/drivers/soc/apple/rtkit-crashlog.c
> +++ b/drivers/soc/apple/rtkit-crashlog.c
> @@ -13,6 +13,7 @@
>  #define APPLE_RTKIT_CRASHLOG_VERSION FOURCC('C', 'v', 'e', 'r')
>  #define APPLE_RTKIT_CRASHLOG_MBOX FOURCC('C', 'm', 'b', 'x')
>  #define APPLE_RTKIT_CRASHLOG_TIME FOURCC('C', 't', 'i', 'm')
> +#define APPLE_RTKIT_CRASHLOG_REGS FOURCC('C', 'r', 'g', '8')
>
>  struct apple_rtkit_crashlog_header {
>         u32 fourcc;
> @@ -31,6 +32,24 @@ struct apple_rtkit_crashlog_mbox_entry {
>  };
>  static_assert(sizeof(struct apple_rtkit_crashlog_mbox_entry) == 0x18);
>
> +struct apple_rtkit_crashlog_regs {
> +       u32 unk_0;
> +       u32 unk_4;
> +       u64 regs[31];
> +       u64 sp;
> +       u64 pc;
> +       u64 psr;
> +       u64 cpacr;
> +       u64 fpsr;
> +       u64 fpcr;
> +       u64 unk[64];
> +       u64 far;
> +       u64 unk_X;
> +       u64 esr;
> +       u64 unk_Z;
> +};
> +static_assert(sizeof(struct apple_rtkit_crashlog_regs) == 0x350);
> +
>  static void apple_rtkit_crashlog_dump_str(struct apple_rtkit *rtk, u8 *bfr,
>                                           size_t size)
>  {
> @@ -94,6 +113,66 @@ static void apple_rtkit_crashlog_dump_mailbox(struct apple_rtkit *rtk, u8 *bfr,
>         }
>  }
>
> +static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
> +                                          size_t size)
> +{
> +       struct apple_rtkit_crashlog_regs regs;
> +       const char *el;
> +       int i;
> +
> +       if (size < sizeof(regs)) {
> +               dev_warn(rtk->dev, "RTKit: Regs section too small: 0x%lx", size);
> +               return;
> +       }
> +
> +       memcpy(&regs, bfr, sizeof(regs));
> +
> +       switch (regs.psr & PSR_MODE_MASK) {
> +       case PSR_MODE_EL0t:
> +               el = "EL0t";
> +               break;
> +       case PSR_MODE_EL1t:
> +               el = "EL1t";
> +               break;
> +       case PSR_MODE_EL1h:
> +               el = "EL1h";
> +               break;
> +       case PSR_MODE_EL2t:
> +               el = "EL2t";
> +               break;
> +       case PSR_MODE_EL2h:
> +               el = "EL2h";
> +               break;
> +       default:
> +               el = "unknown";
> +               break;
> +       }
> +
> +       dev_warn(rtk->dev, "RTKit: Exception dump:");
> +       dev_warn(rtk->dev, "  == Exception taken from %s ==", el);
> +       dev_warn(rtk->dev, "  PSR    = 0x%llx", regs.psr);
> +       dev_warn(rtk->dev, "  PC     = 0x%llx\n", regs.pc);
> +       dev_warn(rtk->dev, "  ESR    = 0x%llx\n", regs.esr);
> +       dev_warn(rtk->dev, "  FAR    = 0x%llx\n", regs.far);
> +       dev_warn(rtk->dev, "  SP     = 0x%llx\n", regs.sp);
> +       dev_warn(rtk->dev, "\n");
> +
> +       for (i = 0; i < 31; i += 4) {
> +               if (i < 28)
> +                       dev_warn(rtk->dev,
> +                                        "  x%02d-x%02d = %016llx %016llx %016llx %016llx\n",
> +                                        i, i + 3,
> +                                        regs.regs[i], regs.regs[i + 1],
> +                                        regs.regs[i + 2], regs.regs[i + 3]);
> +               else
> +                       dev_warn(rtk->dev,
> +                                        "  x%02d-x%02d = %016llx %016llx %016llx\n", i, i + 3,
> +                                        regs.regs[i], regs.regs[i + 1], regs.regs[i + 2]);
> +       }
> +
> +       dev_warn(rtk->dev, "\n");
> +}
> +
>  void apple_rtkit_crashlog_dump(struct apple_rtkit *rtk, u8 *bfr, size_t size)
>  {
>         size_t offset;
> @@ -140,6 +219,10 @@ void apple_rtkit_crashlog_dump(struct apple_rtkit *rtk, u8 *bfr, size_t size)
>                         apple_rtkit_crashlog_dump_time(rtk, bfr + offset + 16,
>                                                        section_size);
>                         break;
> +               case APPLE_RTKIT_CRASHLOG_REGS:
> +                       apple_rtkit_crashlog_dump_regs(rtk, bfr + offset + 16,
> +                                                      section_size);
> +                       break;
>                 default:
>                         dev_warn(rtk->dev,
>                                  "RTKit: Unknown crashlog section: %x",
> --
> 2.35.1
>
>

