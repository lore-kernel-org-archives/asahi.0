Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BCC354AF2
	for <asahi@lists.linux.dev>; Wed, 18 Mar 2026 06:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773816703; cv=pass; b=h1PU/mi0/QOLEbC18DKG39QavWPVQVAG1S+pcawUHATigH9vFMl8BTVdQ9DQQP6WL649WddkGVZl1tR0tRmsw5Ggt/lHpXYGvPP9LZ7+7/el8kmgjkALApp3B/HWg/2HyFB+OokvtWUh33qz1eoEo8igI4Mge5I4UJPfUc0QKRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773816703; c=relaxed/simple;
	bh=mHisScyIb70dZhx5FQQdXKEwmbf8+kFtEoU6N26YpzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FY4isrUkjuGMRHMhdx/yUEpMY6zAME6/MSzKPrGgJN0Wp8ymyBYNgXuWCixIFvI/nol10wArVfAWY+x9KUEZ5fGRv6L2S/Lz7xUMX6XDfSYX07zuGuRhyZkFux//LQnpBvAvDvWmrll7mEI2eZ+TY7DmxJVbLuDkO6zcC06XiVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MVfvbuTc; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MVfvbuTc"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a12f88d839so6598062e87.0
        for <asahi@lists.linux.dev>; Tue, 17 Mar 2026 23:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773816700; cv=none;
        d=google.com; s=arc-20240605;
        b=gK4ApAx7t46mGKLxnyDpJKHE5oMENuZnTQTcTW1/dQEJZYV1wktZa+3IYAtMU5aTYN
         mcfgnPWtxprMl7oxAYCNHvWxb4Z0haJhEYXPS5YxMHF7YR1SRPLv/X0sr5H7oGw/H4nw
         G7UuST4l9iC/kwW09vxXoyKYaP4s1Gl223WzChdUFo9A7wh3SSW5HRKzVskc4K+VqKqU
         M4ihNluQg2cazNWHnOLHBisUdklSu/gAdviqKX54sGzI8sfLKcNTMHplA6w4X/dJ4ccz
         FN1M5Ni/3o5sl4aTtbIrnitLwm1tqPFDKwdxVckTxZuBjpjk87c37589lSHdAkFrggEx
         ItJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3AIpEMFSc1w1UU+CwQpv+mXG0dXIbG8YyU6JKJWt2Ig=;
        fh=wkH+eBy2FY7PBuuEcypcYi/d6wBzvwM9tH7x3/1M4hc=;
        b=aZkK23txwejgBLVIglasDdSz8VVotlJGcaDvuLw6nmT8I20lhvpC0STG/FznvUsx0L
         4qzSpYtyvoysUGyKBrjgDz3gxFvwC+POa3IwxYVOX37VsL4K+18xyMh2UwsYMRQt2062
         +DmQAv0Uk8ZHCY08ZYWD1W7mUjEq4JFL6BlNRhYRBFVb6aSx170/BwJZRXsAHxQhUkY6
         QSxQODnURQxs+87B5R9dRlbbraWQhe1nrNrqaSP1xcF5v1cEIvzUHJhkjAweDyEp99hD
         7/BCEDKDU8iRZMp4jaEaizmMogD2q5GryyrhZTtCZjVCPVEWjrZ9LQ4/nU3likevr0oc
         uAmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773816700; x=1774421500; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AIpEMFSc1w1UU+CwQpv+mXG0dXIbG8YyU6JKJWt2Ig=;
        b=MVfvbuTcXtPmORjydhpM0FM9cf2Kedxv4Se+FhIDvVk2mVG+2CLdhU1nAky7ba6mve
         d3qaIjzd4ubCKSjq/rRvHBsQYBPgY9l172ajlbENSwrlbzDMK4gR0/ezv2h4a81ZcCUv
         5ASczRMI4b0aW+KxezJOPUwC4XiGsEtTLyHgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773816700; x=1774421500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3AIpEMFSc1w1UU+CwQpv+mXG0dXIbG8YyU6JKJWt2Ig=;
        b=qATcqYiEIWZq0RxLLpVhhCr4f9R78GUhWkucYs/PTiCaP61wfGqx054paS68jH1psu
         VIfZAkccyGA46HlSneEcNS89NxmfJwOQwwlMK0YF9Vw0GezO35xtnXQPZjZmQ9+zPEJL
         l68fPqdXxbetw5YkiZA8DM7mOlGTbBd1dZ4xfmoGCi6lnJnRqDUyMWcUU/iZs3RZ7eiZ
         Ied6nY7rk/bim2jIk9oRYzU6E7lsQsEkRtV17zoBy2oMfq3nTdmRXH7IpzR9cn2BTADP
         BJwgRzHqniCopmLuwPTwtFCD7MLuMgG4JspIP0cgTIaR6AIqxa07qN3EtP/8//O7ftUM
         Ud2g==
X-Forwarded-Encrypted: i=1; AJvYcCXJBH5C8E58hSK1II5mTy20oIMSPeUMrGAGDSJ4wtTiVsZAP1tNUMBMhNrwLYoq8FiwJO5H1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHp15oNX/60OoCYq6QD18EzeyRZtySqSLY3uxuxhjDJHAWGHMr
	6whTDkTaD1sZ/4AWvktNHOV4Zm3a4TXHrm3DuNrgLv1vMpBDKRiQYqamXec5XBYGLEQHiNzvWBk
	SVa5A3m5CqjChXIHRF3YDSaf7ZWyXdPzi6AaiGUGO
X-Gm-Gg: ATEYQzxgS5MKDyH1mqFGCZE4QJq7YinRrEc6OXwPyviOB2IxeGL/6gqnJajCEebx0pc
	PuNPBu4/TbnV/jRnNAW/tx2FJi11Ufh6GqJmX4yu6dWvKDdHzPbvy+WRPwRo7yX3Xv9tKaEfGis
	yx60G4qrL5Xg399Dt0RcAIfmk1pDwA+/NDMukivxx0M+FSClJrMFf+6yAq4GyEHoSrBtDESdg4Q
	fpq6k6yjxWR8NQkYovXK6yqaqlxdI7WmtGjJSawafCWVLtGRe7+Bvhzp0QUQtbd4eoGmQebtv/a
	UXjoJzkarpHR2DvdUxT8YUnC7WfDSmEPi78u8Q==
X-Received: by 2002:a05:6512:39cc:b0:5a2:7b43:62da with SMTP id
 2adb3069b0e04-5a27b4363damr337188e87.30.1773816699777; Tue, 17 Mar 2026
 23:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317064049.696795-1-wenst@chromium.org> <20260317064049.696795-3-wenst@chromium.org>
 <607daaca-79ed-45b2-941e-1680a17618e8@suse.de> <CAGb2v66D3=s9c8oJyYEAK90A4SekW6FjLUpWBGRHnJwtfMvUeg@mail.gmail.com>
 <ada8ca6f-a2f2-4f8c-b916-f6dc24db6db5@suse.de> <CAGXv+5GUmCEDM9XcOgHL5EKNhZMNc5RTdeheqLAT0CFp=qJavQ@mail.gmail.com>
In-Reply-To: <CAGXv+5GUmCEDM9XcOgHL5EKNhZMNc5RTdeheqLAT0CFp=qJavQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 18 Mar 2026 14:51:28 +0800
X-Gm-Features: AaiRm53nz_HSaQkfIL5l8CVEXOdYGY4r-GTPWU2czp-tZ8-rpvpmtLxKehanc8I
Message-ID: <CAGXv+5GF8zPjgzSy68x7wxFLc=zEMac1VVE8OUcBH1+=GgqMGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: wens@kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 12:57=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Tue, Mar 17, 2026 at 8:24=E2=80=AFPM Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
> >
> > Hi
> >
> > Am 17.03.26 um 11:58 schrieb Chen-Yu Tsai:
> > > On Tue, Mar 17, 2026 at 4:12=E2=80=AFPM Thomas Zimmermann <tzimmerman=
n@suse.de> wrote:
> > >> Hi
> > >>
> > >> Am 17.03.26 um 07:40 schrieb Chen-Yu Tsai:
> > >>> From: Rob Herring <robh@kernel.org>
> > >>>
> > >>> Introduce a new flag, DRM_MODE_DUMB_KERNEL_MAP, for struct
> > >>> drm_mode_create_dumb. This flag is for internal kernel use to indic=
ate
> > >>> if dumb buffer allocation needs a kernel mapping. This is needed on=
ly for
> > >>> CMA where creating a kernel mapping or not has to be decided at all=
ocation
> > >>> time because creating a mapping on demand (with vmap()) is not guar=
anteed
> > >>> to work. Several drivers are using CMA, but not the CMA helpers bec=
ause
> > >>> they distinguish between kernel and userspace allocations to create=
 a
> > >>> kernel mapping or not.
> > >> Any dumb allocation might require vmap. This is not limited to inter=
nal
> > >> buffers.  Because if the dumb buffer is shared with another driver, =
that
> > >> driver might require the vmap for displaying the buffer content. The=
re
> > >> are enough of such drivers.
> > > By sharing, do you mean exported via PRIME then imported by another d=
evice?
> > > Or just passing around GEM objects within the kernel?
> >
> > I mean PRIME/dma-buf sharing.
> >
> > >
> > > And could you provide an example?
> >
> > Create a dumb GEM buffer on one of those CMA devices and mirror it to a
> > display or udl device.  These devices have no means of scanning out the
> > provided buffer directly, so their drivers vmap the buffer and copy the
> > pixel data into their internal memory (via a peripheral bus). The vmap
> > call happens via the kernel's internal dma-buf interfaces. Hence any
> > driver needs support for vmap if it wants to support this use case.
>
> I see.
>
> In that case would it make sense to limit not setting this new flag to
> drivers that already specify DMA_ATTR_NO_KERNEL_MAPPING? Or rather
> inverting it so the default without the flag is to have the kernel
> mapping. It would be opt-in rather than opt-out.

I guess this won't work since drm_client_buffer_create_dumb() calls
drm_mode_create_dumb(), and we need a way from the upper layer to
say we need the mapping.

> This includes just exynos, rockchip, and previously mediatek. Having
> this would allow moving them closer to fully utilizing the GEM DMA
> helpers without changing their existing behavior.
>
> The flag was removed from the mediatek driver during a previous
> refactoring to move it to the GEM DMA helpers, but I think it was
> a limitation of the helpers, not an intended change. Angelo might
> be able to provide some context around that.
>
> Or maybe I just keep the dma_*_attr() conversion patch to satisfy
> the needs of the aforementioned drivers? What do you think?
>
>
> Thanks
> ChenYu
