Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28B82376EC
	for <asahi@lists.linux.dev>; Thu,  5 Jun 2025 13:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129966; cv=none; b=Jly9/uTnDHZtpAuTvOoAnSa1SyMb4V2bYyhlKQIit5/m2GRTfbJajYhyTt2kch8cZy4wNg6aSV0IlwBJEPRN8LdC9IqJDJvulZ1DHLbJWS94OelFp/QpVYHeeY8kfEgTvMuxih57xe+aeaxvc9ln2I3T52uHslaDGnPhCAH0GsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129966; c=relaxed/simple;
	bh=OhVG2kN4LoAfwvL6GSSBxcG9jP3N0nwH7XuxrOA/U88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGTn250nFU1Q3j86G87Dart/00jw9cKcNA7q+WpGV6+6wdnOKvz54PPkxwmxiRBi3FnAHZoIpm+FNFGVnyBeHK0E5H+al6LXQJx0fCOZP/RSLrvZFk1OOCdQEMYoltVTyw/vKFsQJ/F+tcrU1/JPsdng3yxUkT6n+HUxi0a8kV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wIzOe9NO; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wIzOe9NO"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so7776171fa.2
        for <asahi@lists.linux.dev>; Thu, 05 Jun 2025 06:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129963; x=1749734763; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhVG2kN4LoAfwvL6GSSBxcG9jP3N0nwH7XuxrOA/U88=;
        b=wIzOe9NOL6XFdVYeB94bNKOhVMPPDmdsSGHm2My8jiQhD3mFY5VjyB2INxSUzvEBW5
         r2X0q3h2DosXj+dRdcomMCbmgy1el6jU7KewF0zw519eVRNB71ONXsmRRKuAjazR55JB
         KqyQVCAryPl34qH2p7g4vNR5+e7UHWzfuRQ4+jOvH2ILQgzS53PMvD9GQLGDc/ZmCeBi
         wVEIAS60I0hQhwZfpotv7/tmvEt6UUMBZJ/fm14Ba1MSmvGzt5pUMLKIY6m3lepgY9vv
         js/6wmd5LTKNA7/yleluS7/HrUw0t/BRm69QQmcLm/oLIyR8ztYUqHShfB5cgqSaRrLD
         py+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129963; x=1749734763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhVG2kN4LoAfwvL6GSSBxcG9jP3N0nwH7XuxrOA/U88=;
        b=aqN8lWfK5PdzYnK8WA5ZzmK9XfPHztJ7g1bsD+u5Zwh8P6b0pwMXX8oZEa6DpI34eO
         GWTSjQV5L4YKEOs0H2byNsgYtLTOYea4rJDzdfiJzlWM/0dLhmrTT3jeFa5NSy2IFHdY
         uCNxbgTWC+hvWIwIaapDqWWJfe17g9tMtwdK7e8k+GEN/G5odOhjo/L+f6m8x6JjDdxO
         QISlGqG/hQgp+Q5X0auz1XFvLbuaF0AmiamAzqZ8mAyrrLkebP6ha83s/SAmIHCGfsm4
         YqfaOs+tR6E2JEKhVzd0aQsmwoicpUcGiLkUkFn0dSmA7Cy7F7EYv3PW//9Bf2B61+AA
         miPA==
X-Forwarded-Encrypted: i=1; AJvYcCX5lUPd0oNlvLndwHNetogdNgi9/hBo5kcHcjA6wVCBCvGNLhM6QVMWypKJBt6etYATkxtvhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFOL4x6jMh3B6HIV5eXp8cVObBN9ZOeju0yLZX6NHycyEX97kZ
	fVHUOncE39Hf+WY/cTkSVwemhHdZIb/V5QFjVaf+E66IVcdj4gkczBpUa1+1OYbICw0lwiaY6SL
	hw7x6FmSStPZEcPPvjh/oMmB7ZEsCV4wdHwZJNOmJuQ==
X-Gm-Gg: ASbGncuaSDO65zPr8Si7WjcPNjm2+4/jPKZNq62AEc2nORpylFGiayuoBzy7Xr2x3kA
	dsFduhHKbhANW/Xh++n/XQb1y5+ilPxBs4iV9SEw0LHJBSUrN7Wj51cGW+xMHE402Ej7bCOgsDe
	JXIh8QzFrZmnjkviYTm7+20Y/WGpMQjDysLobKJrw68co=
X-Google-Smtp-Source: AGHT+IGzkG6Ev8DgBi85YJ8sl3jbCPXRA28i4r/pxYrAP5o+fCPD/kuEmxicVyoL2xsSDiMRi26UOm+0/MOqiRfdIq4=
X-Received: by 2002:a2e:a902:0:b0:32a:7a4d:9450 with SMTP id
 38308e7fff4ca-32ac72ac20fmr31835671fa.33.1749129962831; Thu, 05 Jun 2025
 06:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-41-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-41-5d75a3711e40@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:25:50 +0200
X-Gm-Features: AX0GCFs01csf8csUF9o0pkVY61rk8HDa8aAw9AQmVv_cMVBcNF9E297jzPpGnpg
Message-ID: <CACRpkdYTXwhuAWHvpMNj1w3ekmPoRkXE2k5TnrWwB+hFjG9QUQ@mail.gmail.com>
Subject: Re: [PATCH v2 41/46] panel/widechips-ws2401: Use refcounted
 allocation in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Robert Chiras <robert.chiras@nxp.com>, Markuss Broks <markuss.broks@gmail.com>, 
	Artur Weber <aweber.kernel@gmail.com>, Dzmitry Sankouski <dsankouski@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Janne Grunau <j@jannau.net>, Michael Trimarchi <michael@amarulasolutions.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 4:53=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
