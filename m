Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC5E1F8725
	for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 20:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873654; cv=none; b=Co9nhU7sypZCI59eqw4U2bT8rdNdqoqeC5XW0k5XOuyScITsXN7CUSaEr++TMmLpAhSmB3U/OBNWgDUuimKmTNqzfqqrB2teeU0pQqXZtq2lUSeHwMAK5YPgMlq71XQT4iWdgHTIhbr/QEvsKYRnnUyYHK4ANw/+ZJPhvbh4HCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873654; c=relaxed/simple;
	bh=n4WGwCItyZewiOJcBSp4Eaj+wnGcnc5O6i3QGT0fNG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uX5SygcFC4CaMVwojtmsba5VeJ9Qp66+ZI8qvIR3ntyuO25B+C1NagGAjmxpjTeMvLt2O4Mfmr4JmqlwjKK6v+UkVoSlCWweqA8RgfqZvIIkIhEWClQqEQ7rJTWrpkiSGSqE1PtVAT/jI+gZpuwgFupNUBXlhiuLA7iaNW9ajmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VQWKvAVs; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VQWKvAVs"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736c3e7b390so5389574b3a.2
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 13:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745873647; x=1746478447; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=VQWKvAVsRFcPhI3QzPcychYEbtjKnBB5pWoqyEGp5hUsbvZ1Xk6ICgWktwdRTEKcP2
         +BCT2O9TqrLXuTQzqqHc8Abg36Gl5C7nauWvnfRmSSf9bhvIgNEithiyflaxMQzFq8SW
         CyBAEguEhm7pnSML0fAqUjfoKU7aa1ScnTNaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873647; x=1746478447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=P3xQ1kvDGe72UF+2WhdTwx53DlAuweB7hXob0rtcsvDo5s7vUQJlYf6cCgFQZiPuCB
         sorSKH4Fi0PquDu1aQewxesDqAtl1rHjFdaVjY58QX2Oa8JVF4FM9WUzui/IVL/1Zgzc
         i+G57lASOB3EL+kE37QNnzyGAGxYL9Ucf5DzD8yezoIE0Ij7lgEc5yud7dPCZPHIcHxd
         mXfj3R6wM4v23DM2kGckmukcJClKohZI+642WcbTPoExjx0juVUhtsOkbDN3F0oLZ3Eb
         pdicnxsoHrFsK4jtZkzFPE3VlsMdE2DQ7ftoKwWZsHky3S3QEkC4LSmLjHouXnVTwsHh
         R8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWutAxMUHuAP8WyOyE0tZ1HJl+8Q9GMSEv02l+MGm//VBOnlpwbMzknXg+4fGHWLKcda4jdLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAf/KXhSE20jYT0ZFKbYxCTrPN40/004EwA1yYiA8iQNLzUXRn
	qSBGzs9sX5aILNRtOZx/wpK8mgJUqIVNNa57Qr5EqP8qoqXQHfKdw9g7CdNVnEbT7evs+++S+P0
	=
X-Gm-Gg: ASbGnctjiX5wF739NrqLGw8+GnH8KXz67aD+1mamt3pYaRunbPWNSWdUUUktetKRySz
	UWd/C8PNHPWLfDG8y4ezv//166pD+/D0D7LCs/qj2SSa0g1JvQRhFRF0n23xIqmEqsawoQmixE7
	4pyLGkFZAxgf+94xxpQIFEG9xY6l7mDEanDA0/rJrhnWR5rDGq0+PMMO2WYV7Lcs7omj2DWmLjb
	owz6CKwaLiyqWt8QbnbA1OEcRwkw2a8B3QU/K7OihJW9miCjwN1P5Ofkv3q6dTihgG5rmvKvWhm
	6Q1hO+AC/dYYtU14438g+Sz1CCBOz2UDsoFBPxVFYCqRBm/fnOvNp52I9m9w0p64TvFOYolQC2U
	J8us1DByifhZe+W0=
X-Google-Smtp-Source: AGHT+IFOhapEVIRAjf4xnVYCoWp723q7xmsTf5DyZjiKoFMZAr1JVcV9PqI+HNawKd5mk5sg+ftXZw==
X-Received: by 2002:a05:6a21:1511:b0:1f5:769a:a4c2 with SMTP id adf61e73a8af0-2093caf4415mr1196108637.22.1745873646832;
        Mon, 28 Apr 2025 13:54:06 -0700 (PDT)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6ab27sm8505823b3a.110.2025.04.28.13.54.04
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso4407047a91.1
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 13:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2t6ZTyfUXkJuMdtNmtos+YRyIUyUVrmofuDXxUBz0E1UFpMEEcyjXsBTRspoL4rke21+aiQ==@lists.linux.dev
X-Received: by 2002:a17:90b:2d08:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-30a215a9e35mr1596359a91.31.1745873644318; Mon, 28 Apr 2025
 13:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:53:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
X-Gm-Features: ATxdqUGX6srhk44LYXds4__tJ7VKjYOOGbCee4VbhetmdBaO7SswZM-oniFpcj8
Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] drm/bridge: ti-sn65dsi86: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 24, 2025 at 12:00=E2=80=AFPM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> This is the new API for allocating DRM bridges.
>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I can confirm that I can still build/boot on a board with ti-sn65dsi86
after this patch. Thus, happy with:

Tested-by: Douglas Anderson <dianders@chromium.org>

Happy to have someone else land this through drm-misc-next or I can
land it there myself.
