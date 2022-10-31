Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7793C00
	for <asahi@lists.linux.dev>; Mon, 31 Oct 2022 18:23:08 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id b2so31608386eja.6
        for <asahi@lists.linux.dev>; Mon, 31 Oct 2022 11:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a4rZhUH4ZpLMhBAqpfgdI9c7u8+KCLFpVpEFUicGMn4=;
        b=GgM4/QujTRQ05JzoJoxOXsdk7HHVGSupVn0YESMwsNLFruqKu9FeueaBfHbCvR1X9W
         /oKRptwJv97/KvG1CQqMuiJeDajS/M6d2xqOH5eEnH7o4jSh7hsRGIFN94u3DtCBQ5H0
         Bn1t0aM7ftW30HmemMZ3Zj8M4eIZ8zFwdMdew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4rZhUH4ZpLMhBAqpfgdI9c7u8+KCLFpVpEFUicGMn4=;
        b=SaQVzzCufEmcUVFaAaKJ79ew3AzLc2XguC1QNBcsH6QVqnD4jePgTVyrtmdpS7zTPA
         XVM/GSz1UoMN2BKEtLMXNhjs0+X7QzHu2SQGrbETjCiJzv72KEfKb5JYuqkSRIMIt9s/
         JJcfbGrwGq3AJ043pttvWiIXjwm6GX8o28UasQI+6iWXmbXd3iQOXTuO4LXeYKeK2AMo
         DOMyx7XO99/4eHTXjge+DNYLjLfhWX2ck57R34/gse5quD4tPBnx6FvX5Q4GlxaoSwDQ
         lKKB7IrHWx9XepLNwVkDrgYhnqpC2bmIbKVYKYOgRNbnZDxzM+XTFiUlHyfONq3kUJtR
         TWww==
X-Gm-Message-State: ACrzQf0CquouMqnye21+Iru2sEJPkbtosE9ho4/ZPbjGqRmIiHJKf8/v
	Qj8G08U6X+L1K4EKrwBPGKe4C0Ao8MUGOIbeaV1JAA==
X-Google-Smtp-Source: AMsMyM5DhoL8s28zzkeeLevlXOzn1Jye7+9SjSZzpbIqMEEJLmIGHYQyoMVmaWUIpW5aaCIrKN/r2n1OP2A/3CGeDSA=
X-Received: by 2002:a17:907:86a4:b0:7ab:afe4:5a94 with SMTP id
 qa36-20020a17090786a400b007abafe45a94mr14305688ejc.7.1667240586730; Mon, 31
 Oct 2022 11:23:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221027135711.24425-1-marcan@marcan.st> <CAFxkdAqjdonoEgOm4Nv-mbyw3OJuuO1=3dXYyn2+yszUp13Bbg@mail.gmail.com>
 <8cd3c731-5501-8bfb-9432-b1b9554aeb23@marcan.st>
In-Reply-To: <8cd3c731-5501-8bfb-9432-b1b9554aeb23@marcan.st>
From: Justin Forbes <jmforbes@linuxtx.org>
Date: Mon, 31 Oct 2022 13:22:55 -0500
Message-ID: <CAFxkdArt_C82q1OXtCS=b_+Rn2cw7QkZp8bg-DwPD-dbBdRAaQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/format-helper: Only advertise supported formats
 for conversion
To: Hector Martin <marcan@marcan.st>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Javier Martinez Canillas <javierm@redhat.com>, Pekka Paalanen <pekka.paalanen@collabora.com>, 
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 31, 2022 at 11:52 AM Hector Martin <marcan@marcan.st> wrote:
>
> On 01/11/2022 01.15, Justin Forbes wrote:
> > On Thu, Oct 27, 2022 at 8:57 AM Hector Martin <marcan@marcan.st> wrote:
> >>
> >> drm_fb_build_fourcc_list() currently returns all emulated formats
> >> unconditionally as long as the native format is among them, even though
> >> not all combinations have conversion helpers. Although the list is
> >> arguably provided to userspace in precedence order, userspace can pick
> >> something out-of-order (and thus break when it shouldn't), or simply
> >> only support a format that is unsupported (and thus think it can work,
> >> which results in the appearance of a hang as FB blits fail later on,
> >> instead of the initialization error you'd expect in this case).
> >>
> >> Add checks to filter the list of emulated formats to only those
> >> supported for conversion to the native format. This presumes that there
> >> is a single native format (only the first is checked, if there are
> >> multiple). Refactoring this API to drop the native list or support it
> >> properly (by returning the appropriate emulated->native mapping table)
> >> is left for a future patch.
> >>
> >> The simpledrm driver is left as-is with a full table of emulated
> >> formats. This keeps all currently working conversions available and
> >> drops all the broken ones (i.e. this a strict bugfix patch, adding no
> >> new supported formats nor removing any actually working ones). In order
> >> to avoid proliferation of emulated formats, future drivers should
> >> advertise only XRGB8888 as the sole emulated format (since some
> >> userspace assumes its presence).
> >>
> >> This fixes a real user regression where the ?RGB2101010 support commit
> >> started advertising it unconditionally where not supported, and KWin
> >> decided to start to use it over the native format and broke, but also
> >> the fixes the spurious RGB565/RGB888 formats which have been wrongly
> >> unconditionally advertised since the dawn of simpledrm.
> >>
> >> Fixes: 6ea966fca084 ("drm/simpledrm: Add [AX]RGB210101
> >
> >
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Hector Martin <marcan@marcan.st>
> >
> > There is a CC for stable on here, but this patch does not apply in any
> > way on 6.0 or older kernels as the fourcc bits and considerable churn
> > came in with the 6.1 merge window.  You don't happen to have a
> > backport of this to 6.0 do you?
>
> v1 is probably closer to such a backport, and I offered to figure it out
> on Matrix but I heard you're already working on it ;)

i am, but I didn't want to be, so I thought I would ask.

Justin
