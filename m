Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F6B78F5F
	for <asahi@lists.linux.dev>; Tue, 25 Feb 2025 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483479; cv=none; b=kp9+8fg4C10f1QFaIGqIUAuvt3CXHTaF98yAJO8A2CepnWIhcbXAcIIcnlnpd6Qy5DbhDkwRZH/W6HNlVIHvISIgvlcefxNI/1VbE9JHfEo9oDqU21KqefQFknmrmOGrJN03RB32Du0ACeWPxRKnrjxiZ+dP65/vseg3kxlHBno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483479; c=relaxed/simple;
	bh=yt2R0RS1TqSbKw/Jt2UsZPUVcnMdVRQFPe4UhVWU6gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GSYoovWIMNO3S6tIcq+9o8xzsrzNQeK4IJ1B7c06LOrj1E59ACp3xNibHRc/iFpP3VyTe/beDJ6arz2qI/dBt/kFXsZIVzyEMrHlb1i82iLBV09gbnC9FmwpcGEEqxYbKgtNDpFN9Y2N6iskhv/dnBvcguUpGrhPJuSDNFQSM1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EqHVLmwA; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EqHVLmwA"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e461015fbd4so4028009276.2
        for <asahi@lists.linux.dev>; Tue, 25 Feb 2025 03:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740483476; x=1741088276; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n1TWnKYSjWgGvb3cyxt3TX5DamTHuovBzjkuSknBSeU=;
        b=EqHVLmwAh17nLRbw8JeDhlucepi1ez7yVF64fC+5tuQFhJm3WNQ1QqgURcuFdYO/dz
         4tkDhU8co62vUsrqm/SijrITUwlQOpltG/AK3s0Fvk8I37UZYDMsRgjH/0vWvXbdaMAA
         WKLlVNjmUy0pV4/G/fMci7TAGB3EHLsrMAp9Vjy+NMyhfZm4IO7byPUJWTgMOoVKl4gL
         0FDOei4LWGvcvx+u1zXeYd4+7XSg2J7HneE7fh6qs547nH3pdmV7FeKMHPlBI6SlQt6J
         en2BuC9IkkaPps5ZU0060nir5/76JRMu3ugWeSU/AZ4ekP9z7R7MqKtapdrI4GEIatDj
         OEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483476; x=1741088276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1TWnKYSjWgGvb3cyxt3TX5DamTHuovBzjkuSknBSeU=;
        b=wrJoaqBfe2sjBDp+BgD0HzreC6hDN6S+LC3gCk23rQHtE4l8nLsqlxK8pWFSu69mYc
         GQfSxJqg0XScq1MDgR7hUmAwb3MnfBTgGVSwaRetpgkQC7zTLSqunK8SpSSekLXzq67U
         vHVnJrbCUvUMzchF738GYUYcg01RlNlcFYeGXXJtQcrL4Kw3tC/zfjqODYlkD5mRi+7v
         lWQ30js4UtSK/ndotuae6rve0pH60ue3OBRgoQDiFvHkdIoW9bRykzkT5cVyQTUXCjm7
         so1D4vVNM4qrA7GQOhtRMRN0mLPqIzz5Mc6/aAaUUSwq4o2cyt2o3NxF2V6dzKQuLloa
         wldg==
X-Forwarded-Encrypted: i=1; AJvYcCVhd/XX3udxKwJiRnwY+8MswhxW7i4yggyXDuly1LQw3jR4yME6Y5OqErfC6bV2Lts5s95TLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YymSrgquHuex4FsNQ1YhQ+AXlQGKNOgZCIIYyuOn4DoqS8spYKU
	kNv6g2m27s8/HyULFt50ep76NpyKHlAYEjJU82cID7S9W2+uMywG5QL1V/7QwZ5mIrVRs7/Rvo6
	gFbHOAO1FAvH53HPxlluxmWwVRstA8+HrmrZd+w==
X-Gm-Gg: ASbGncvAXV8c2AMsQxx8okJv97r8tHFozmUK7WqQtB21lOVvE+CXM341+a/2VQhXhxm
	OXnPN0mITB/bPRUVw8oeEKpRTPb1iJhGASQcA46oEeaU10z0mka2U3GrLUuq3c2uqjJOL5pZKDh
	0A/xY5Mm7Vq2O7cpnwXOzcHDU0k4q1N5ibSk3YOdE=
X-Google-Smtp-Source: AGHT+IFoRV0tABvVleGcPGFjITHVSAozbUIV7vt/JXOPnNAtmYOOQYQ8LJ70dKpeCX04ppbU+mmusjSHjBwHx6qf6uI=
X-Received: by 2002:a05:6902:18cd:b0:e5d:fccc:7907 with SMTP id
 3f1490d57ef6-e607a4e3c9bmr1939202276.14.1740483476663; Tue, 25 Feb 2025
 03:37:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com> <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
In-Reply-To: <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Feb 2025 13:37:45 +0200
X-Gm-Features: AQ5f1Jq_8vz2X92aaDmmCRK3QuSACEM5CmHNBFF9CumkaBecyk4PuPviBAdIWp0
Message-ID: <CAA8EJpqM8ZQ-ScEtEBXaUF2Nargtp_TBAyMYvbJ49PGbwPWjaQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display controller.
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alyssa Ross <hi@alyssa.is>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Feb 2025 at 12:25, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On Mon, 17 Feb 2025 12:39:30 +0100, Sasha Finkelstein wrote:
> > This patch series adds support for a secondary display controller
> > present on Apple M1/M2 chips and used to drive the display of the
> > "touchbar" touch panel present on those.
> >
> >
>
> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
>
> [3/5] drm: panel: Add a panel driver for the Summit display
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/40115947b59f2ca361a47615304dff0a2b69a2b4

Without the bindings?!

-- 
With best wishes
Dmitry
