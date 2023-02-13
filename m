Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C8F8F7C
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 17:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676308536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bO9yWwo9vtU3iHdmRXxQpw7q9DBKrgQFiJMFo0shriM=;
	b=PMmtSVLb6jTUa1kS5i4JPamOxaP5wkAjD4FiuZ7CxuOhuGQLPX4iuIDxFCHxGu8f8cLLg4
	vvLKT13/Gx+gpgK4ahLXmQNv9WeGskl6B+Y4ysPT4qk4eius6HOgBLGxQdCqGL9cq4X1+B
	L410VfDZ4ScNgMZ4RDA93M8eCbhE2Js=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-Tm0DGEJzNmOYUwNoGiNndw-1; Mon, 13 Feb 2023 12:15:34 -0500
X-MC-Unique: Tm0DGEJzNmOYUwNoGiNndw-1
Received: by mail-ua1-f71.google.com with SMTP id o6-20020ab01506000000b004f8c11096a9so4599626uae.20
        for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 09:15:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676308534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bO9yWwo9vtU3iHdmRXxQpw7q9DBKrgQFiJMFo0shriM=;
        b=6MBdAaZVojgOd4jacR54aSBC5iT/7kKEtS/q4k/0QWNFwsNifJ3MQxtcbCCd8NWWDx
         eiFs5NxEa0Ty4o0pWDJYMBqjPGDIrEi0/ENMIguQ2fAsbPusbM2I5U39VUz4vowN3zB0
         5Lfx3kCa0HsUXogDwp6JLFSkc+4s23Ff9r9v1i2nqvhsNXvkTsmj/rUJl0hsazko7Eug
         ex8glLenpJzknP1MjI9Pysq/UfqwTy3L8YA1xUX2LP7BOh8Ms4wnd20UmbK7rnG245l8
         +9Yc2przBXUYO2sULSpDLoNujCOAZdvi/LyjWTt25O/TnCCEdnrjk4B+fFWdGNlaZWyV
         NbUA==
X-Gm-Message-State: AO0yUKV74z5nnedvGev9kz2RBopwM5btBZD+TOEsMh0FzKCVOkMiqdoW
	6Y7/+ShU6TbbHV1o15bFLObFVF/lUClH1WI/zpsteiNBkq/TtNpscumiphgO/s9yCDupzbKFFHk
	DSAjW1IeQhqLLKFZs/4ajYLM/XnoFVgo=
X-Received: by 2002:a1f:b685:0:b0:401:b0cc:f96f with SMTP id g127-20020a1fb685000000b00401b0ccf96fmr149915vkf.11.1676308534160;
        Mon, 13 Feb 2023 09:15:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9SCfvG2pXjcynyi3JTNlAgUIexnHd1Ro0ps7FctoZkveGxkgYQ5kpx4sOfqRSiZHb0pjNBjmGb22dmQ3G0C0Y=
X-Received: by 2002:a1f:b685:0:b0:401:b0cc:f96f with SMTP id
 g127-20020a1fb685000000b00401b0ccf96fmr149909vkf.11.1676308533926; Mon, 13
 Feb 2023 09:15:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230211091302.4576-1-lina@asahilina.net>
In-Reply-To: <20230211091302.4576-1-lina@asahilina.net>
From: Eric Curtin <ecurtin@redhat.com>
Date: Mon, 13 Feb 2023 17:15:18 +0000
Message-ID: <CAOgh=FzCOvv86HG=AhCBDW6cUHDnzq8UPBgmYPR12PNNMRNx0w@mail.gmail.com>
Subject: Re: [PATCH] soc: apple: rtkit: Do not copy the reg state structure to
 the stack
To: Asahi Lina <lina@asahilina.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 Feb 2023 at 09:21, Asahi Lina <lina@asahilina.net> wrote:
>
> The register state struct is 848 bytes, which ends up bloating the
> apple_rtkit_crashlog_dump_regs stack frame beyond 1024 on some
> 32-bit platforms, triggering compile warnings.
>
> This doesn't matter for 64BIT/ARM64, but there's also no good reason to
> copy the structure to the stack in this case. We can use __packed to
> avoid alignment issues, there are no double-read hazards, and this is a
> fatal error path so performance does not matter.
>
> Fixes: 22991d8d5725 ("soc: apple: rtkit: Add register dump decoding to crashlog")
> Signed-off-by: Asahi Lina <lina@asahilina.net>

LGTM, less copies too.

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
>  drivers/soc/apple/rtkit-crashlog.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/soc/apple/rtkit-crashlog.c b/drivers/soc/apple/rtkit-crashlog.c
> index dfa74b32eda2..8319e365110b 100644
> --- a/drivers/soc/apple/rtkit-crashlog.c
> +++ b/drivers/soc/apple/rtkit-crashlog.c
> @@ -57,7 +57,7 @@ struct apple_rtkit_crashlog_regs {
>         u64 unk_X;
>         u64 esr;
>         u64 unk_Z;
> -};
> +} __packed;
>  static_assert(sizeof(struct apple_rtkit_crashlog_regs) == 0x350);
>
>  static void apple_rtkit_crashlog_dump_str(struct apple_rtkit *rtk, u8 *bfr,
> @@ -126,18 +126,18 @@ static void apple_rtkit_crashlog_dump_mailbox(struct apple_rtkit *rtk, u8 *bfr,
>  static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
>                                            size_t size)
>  {
> -       struct apple_rtkit_crashlog_regs regs;
> +       struct apple_rtkit_crashlog_regs *regs;
>         const char *el;
>         int i;
>
> -       if (size < sizeof(regs)) {
> +       if (size < sizeof(*regs)) {
>                 dev_warn(rtk->dev, "RTKit: Regs section too small: 0x%zx", size);
>                 return;
>         }
>
> -       memcpy(&regs, bfr, sizeof(regs));
> +       regs = (struct apple_rtkit_crashlog_regs *)bfr;
>
> -       switch (regs.psr & PSR_MODE_MASK) {
> +       switch (regs->psr & PSR_MODE_MASK) {
>         case PSR_MODE_EL0t:
>                 el = "EL0t";
>                 break;
> @@ -160,11 +160,11 @@ static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
>
>         dev_warn(rtk->dev, "RTKit: Exception dump:");
>         dev_warn(rtk->dev, "  == Exception taken from %s ==", el);
> -       dev_warn(rtk->dev, "  PSR    = 0x%llx", regs.psr);
> -       dev_warn(rtk->dev, "  PC     = 0x%llx\n", regs.pc);
> -       dev_warn(rtk->dev, "  ESR    = 0x%llx\n", regs.esr);
> -       dev_warn(rtk->dev, "  FAR    = 0x%llx\n", regs.far);
> -       dev_warn(rtk->dev, "  SP     = 0x%llx\n", regs.sp);
> +       dev_warn(rtk->dev, "  PSR    = 0x%llx", regs->psr);
> +       dev_warn(rtk->dev, "  PC     = 0x%llx\n", regs->pc);
> +       dev_warn(rtk->dev, "  ESR    = 0x%llx\n", regs->esr);
> +       dev_warn(rtk->dev, "  FAR    = 0x%llx\n", regs->far);
> +       dev_warn(rtk->dev, "  SP     = 0x%llx\n", regs->sp);
>         dev_warn(rtk->dev, "\n");
>
>         for (i = 0; i < 31; i += 4) {
> @@ -172,12 +172,12 @@ static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
>                         dev_warn(rtk->dev,
>                                          "  x%02d-x%02d = %016llx %016llx %016llx %016llx\n",
>                                          i, i + 3,
> -                                        regs.regs[i], regs.regs[i + 1],
> -                                        regs.regs[i + 2], regs.regs[i + 3]);
> +                                        regs->regs[i], regs->regs[i + 1],
> +                                        regs->regs[i + 2], regs->regs[i + 3]);
>                 else
>                         dev_warn(rtk->dev,
>                                          "  x%02d-x%02d = %016llx %016llx %016llx\n", i, i + 3,
> -                                        regs.regs[i], regs.regs[i + 1], regs.regs[i + 2]);
> +                                        regs->regs[i], regs->regs[i + 1], regs->regs[i + 2]);
>         }
>
>         dev_warn(rtk->dev, "\n");
> --
> 2.35.1
>
>

