Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8B52E5B27
	for <asahi@lists.linux.dev>; Wed, 18 Mar 2026 04:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773809838; cv=pass; b=srs4bAN1CkfowAaknbtj9rV++P3qnAClMdZt+I99afJ1UzvFeui0EIdwKpxiqnpSXNC8FUEx+hQEL/xd8LRO8RixoywiZVI1iyT0kUhd5jsoOFm1RplBizrEdRW/Wimu5BVFRj6uAgjmE7HDtVjxQPt7TVdH5f670dsQJ2fSfeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773809838; c=relaxed/simple;
	bh=a+VCCUq3ikSXZPzLnVbx1GW9DErtC+7r2IDS7I+RgWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MWdUqjB4EecE7HlNb5zJ55jur46f1d/CxcOyVUgxuLSR4Ii+Rd6DC5oZINYWYmZ1t/K1KijeETu1FyNnh0ZNrgHhUVtQeTUmSDumxQe9Eggqa+bM3W9biY0TNvnztBlztvr3brVFLkN5v9JGTuimcA3QPLjM9jnxzlCIg3BAt+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IksvhNLf; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IksvhNLf"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a13a06fc85so7424478e87.1
        for <asahi@lists.linux.dev>; Tue, 17 Mar 2026 21:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773809835; cv=none;
        d=google.com; s=arc-20240605;
        b=LZNQS/N9eaLg/JUbvp3ytY3OISytrD4AJXg1jHzhj/iqwkAO62+o1pzslJHT6ZmEgd
         VPVTuXKQJEMK+QnfcIZkB4gRRFwYhHzsYIW6pltNnRVCsKclji5ev693IryEe/1kpP0r
         trIk6kWifhohAqaGwHwNyptxldMJurQfIvJ+N/zTKPg7FehwujuyVffyGAR47Zmkw41W
         35kUz2VCqlC4OpxQ/1DXD/9JiwwK9b1pSBOQGQel184h2xXasVVs5TI72nRV4bgYd+KK
         dTItA3TdyzkBO7uXc9JpYjXvK36ac6MC+9MGB4F1YiqjiFIqVOg5MTd1iNoDtcIGjdva
         nusg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=80+DeSHfpGw14VHMOKDxWgqpCc09RBagpWieMKMRPqo=;
        fh=ZtWJhc3TaSClW4xNMsJe6LVr/MkPdzkLuOsRcnLPfgk=;
        b=OpFNPYCeElVJKr6SGWQkFcZ6x/OI4HjCoXat3TGkPwNze3Oo8hzz7ddAgHUZ79vuBX
         3tZIpav6Qn5MdiGlw5G9apxbjhV76OhQi6+RY+stp1w/IC+RutUUqLYnsKsohk3bs+F7
         ys5qQJXq/LTyQYn4wsCl4DquADxrQcdvJ4ELMIFWG+U1Bk+xCgm9jnQg+ulVif5+C0nZ
         TAovxaXdI14gtPk86yQ2BdDV+dP/ucGIwV2EdEoQl5SheududSw0l/EfyIikg1ji4WdU
         cmTUutnU0qfEGUxkuP9nakzm+vBDZuxQJF5A9FnFI45hwu7GUBlCmZUr9kMSCWzbPs+4
         K4fQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773809835; x=1774414635; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80+DeSHfpGw14VHMOKDxWgqpCc09RBagpWieMKMRPqo=;
        b=IksvhNLfocATO4lTPTUMLQYxoAJLeQOoy6SAA7nSZfWBv+Bx+U3nFZZ+mrc1YI5z4e
         iVKj3bnpI4Ui65KiHxXf2FUpvJEcA8DT+F4UQun5lJ7DOUxnClK+16NSFPWBF4KjmKIO
         fogzjvkbx+OiJqeYNLuX3yekaPUMczCR8NM+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773809835; x=1774414635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=80+DeSHfpGw14VHMOKDxWgqpCc09RBagpWieMKMRPqo=;
        b=Z/2DP0OiNnfUEtr6zWx6MBqtiOFZo7kzf/fSlCVm+D1Ptg7FaPOpL4LCXY6Vm3Fu5y
         y5FpB4WJ5MPadw/waJgNbOw1go+x0hiQRFKR9jddF+uGy6rr1muz8L3RqN8kMUW+J/sr
         QPNYw17I/SW5X8z085K3ZlnB3dOjTH49AzQDKp5wQqtrbyXLaog2mgQrv9/cSxKYdiIF
         f+IWi/V45x2S2wyQ6KC7d2Xu5r0Rvn0hdUvW9uVMXXojsMjBFsau15ZZMXqaLVbH9v4O
         K1R5x+XSp6xkjj6EiwVRRHrQNX21RAGLcP9CXh0y+k6KbLB9TW4B7t5W9DSp6KfLLuAQ
         dnmA==
X-Forwarded-Encrypted: i=1; AJvYcCUe7uglU0lxa9vdwG2Dj3wq0t4NqX6DLJjgHXZwPwIvqRHhGzRz5EceKwJkfaZ8HD/8wEFIFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyznHRMSM9PSGXhti1+BKLiJiLtqkbDfqEwzJqlKLzismd4NnIz
	yXKAx/3Faf3ze2NAKKgpszS2GSSoSo2zODM3t/MGc7kCZbwzTf4PGwPKK1YTOUIr1gmYx8+HGNG
	wMyBN/naNyMx2ROQ3P8h/apQwD456JQu0O0KteexO
X-Gm-Gg: ATEYQzx6HRrOd2lBhyE00fNe7Om/yj8WCVIcJglJxiKboCkxtLVw5rA1D64cSBy3B1T
	Lr5pxMqYGIov0+a9rdgQ53kZo+Ix/Bs/CMdvSfmpGM37F1uJHLwjfzo2jL3F3b+P974ANOlb3Gq
	7xgvbVTqJma3/Wp6YIOBpz6DIHfhsJg4OGOHBB7aLjKhZFLMh2WQYeK2jmLfMflTAb2en+k3Tlk
	UcXMWDqTF3kH6i2V/PtZnXOWxf+l5vvS4cjLlqE0jjbu7/4NchVqOIJSeTwXYpuReMhG3Ss/HCQ
	nl+2HfcHkuIuNNsJn4IgEUa58fXJR+DP7Trjog==
X-Received: by 2002:a05:6512:a8b:b0:5a2:7b89:4c74 with SMTP id
 2adb3069b0e04-5a27b894d35mr123751e87.44.1773809834836; Tue, 17 Mar 2026
 21:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317064049.696795-1-wenst@chromium.org> <20260317064049.696795-3-wenst@chromium.org>
 <607daaca-79ed-45b2-941e-1680a17618e8@suse.de> <CAGb2v66D3=s9c8oJyYEAK90A4SekW6FjLUpWBGRHnJwtfMvUeg@mail.gmail.com>
 <ada8ca6f-a2f2-4f8c-b916-f6dc24db6db5@suse.de>
In-Reply-To: <ada8ca6f-a2f2-4f8c-b916-f6dc24db6db5@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 18 Mar 2026 12:57:03 +0800
X-Gm-Features: AaiRm51ndr8wIN1dFRJ0R2AdD-JeDrk9Q9pyem8o1kiOTDGC041zyMgTjZn4ekE
Message-ID: <CAGXv+5GUmCEDM9XcOgHL5EKNhZMNc5RTdeheqLAT0CFp=qJavQ@mail.gmail.com>
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

On Tue, Mar 17, 2026 at 8:24=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 17.03.26 um 11:58 schrieb Chen-Yu Tsai:
> > On Tue, Mar 17, 2026 at 4:12=E2=80=AFPM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
> >> Hi
> >>
> >> Am 17.03.26 um 07:40 schrieb Chen-Yu Tsai:
> >>> From: Rob Herring <robh@kernel.org>
> >>>
> >>> Introduce a new flag, DRM_MODE_DUMB_KERNEL_MAP, for struct
> >>> drm_mode_create_dumb. This flag is for internal kernel use to indicat=
e
> >>> if dumb buffer allocation needs a kernel mapping. This is needed only=
 for
> >>> CMA where creating a kernel mapping or not has to be decided at alloc=
ation
> >>> time because creating a mapping on demand (with vmap()) is not guaran=
teed
> >>> to work. Several drivers are using CMA, but not the CMA helpers becau=
se
> >>> they distinguish between kernel and userspace allocations to create a
> >>> kernel mapping or not.
> >> Any dumb allocation might require vmap. This is not limited to interna=
l
> >> buffers.  Because if the dumb buffer is shared with another driver, th=
at
> >> driver might require the vmap for displaying the buffer content. There
> >> are enough of such drivers.
> > By sharing, do you mean exported via PRIME then imported by another dev=
ice?
> > Or just passing around GEM objects within the kernel?
>
> I mean PRIME/dma-buf sharing.
>
> >
> > And could you provide an example?
>
> Create a dumb GEM buffer on one of those CMA devices and mirror it to a
> display or udl device.  These devices have no means of scanning out the
> provided buffer directly, so their drivers vmap the buffer and copy the
> pixel data into their internal memory (via a peripheral bus). The vmap
> call happens via the kernel's internal dma-buf interfaces. Hence any
> driver needs support for vmap if it wants to support this use case.

I see.

In that case would it make sense to limit not setting this new flag to
drivers that already specify DMA_ATTR_NO_KERNEL_MAPPING? Or rather
inverting it so the default without the flag is to have the kernel
mapping. It would be opt-in rather than opt-out.

This includes just exynos, rockchip, and previously mediatek. Having
this would allow moving them closer to fully utilizing the GEM DMA
helpers without changing their existing behavior.

The flag was removed from the mediatek driver during a previous
refactoring to move it to the GEM DMA helpers, but I think it was
a limitation of the helpers, not an intended change. Angelo might
be able to provide some context around that.

Or maybe I just keep the dma_*_attr() conversion patch to satisfy
the needs of the aforementioned drivers? What do you think?


Thanks
ChenYu
