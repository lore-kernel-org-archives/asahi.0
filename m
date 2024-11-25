Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A977519DF66
	for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732534112; cv=none; b=We8Br+ke38B7oeyyDoQrRT6VP7o0xdduqfHG5V/R7jXoCi4rmYdiknxtjKgJXIiToaRJ880QbMoGFlN/bKVqtNAO16b7Ao4+qambL+jnmejTS9VMTTcXKlmQ2QgQat7Dd5o7t2N4VITt7QcFBX/MmQNKqzyN0t/dVUmEKQQpnDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732534112; c=relaxed/simple;
	bh=W07z30b8rfRq3CgjyuyiqZnTwm7THv2X4yGm/T/qTMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhHw2Us17QibhgYtas/O1/TQlxuCjHsoEACY9An5vZ3JtrVzVN5zhjKEc42Dv/+8rVVwdKNl6g+0a5SoSMcawIHPJ8bH8QjCRqCL2PFdYrwBpgtpucgfFmNsOE67LnOLNRs/VyMMymQ/fRv+vMombs6HR9LO0p014PgPxOBlsV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAcrcFFM; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAcrcFFM"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso3472909276.1
        for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 03:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732534109; x=1733138909; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SFECZUVYn+5chgSQNbqMPjSGONkR4VwEA2mP4hQOs0U=;
        b=aAcrcFFMOmeu+K93ERr/z8DV2Y8Ql6RLyHDHyb6f7kxJXBzr192DbJmRsWVMEajHQN
         KEYt80PdxyCioDO1kxTZZeXuBnqNMk0YAvJJhnv4ebvVB88xdqtdAidJMp4d2/2nIVrq
         nwg7HZVcfgLArnQd3SNreQWvP36OH+LLWoHBGCsyKWC2Uedzd60idw41Gdl2ETOFroAm
         4l2YzY5y7E2cer583tM5orjoBfdjOBeqmPwKUHL1y8KalOzPm9iW/ZeyZT2Rsb9XP4Do
         B+Ox3PsG+kthWGiHitrxp8s67FpmaFw7Abr4J7eZiqI0V1Xw5sCt50IAcZwVheM0dUe1
         gmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732534109; x=1733138909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFECZUVYn+5chgSQNbqMPjSGONkR4VwEA2mP4hQOs0U=;
        b=Dl93zUQ4GRRx4ey2rN3PcLMeSQ/tlUy1LSRgEy0TO+LbMmQOct/PVp9uO5/8Rt0wQX
         zmU7CLHkUX2ejxWU0605ernfW7j7oGKlkZBF3loJtxGoDxg/2o5LxEfzBDjzLpR0f7vZ
         lRII/B+rePVg4ILU1HcVSdpXeVSo2I0/aNQEZkT8oCctPe8AFcaDm5AlxnT1q0ZBHYxU
         zLq70ESwdcvEWQnNmdC1XAevK5s+Ae9cmR3gt12xFzP7ORJ4nl8oAzgut38Fc5FPBJ3A
         eLpZKviwzDA+Rwk7Y3on4mQIaXNeq0pOF9zYf0E4yCJKV7/mOa+nKJh1LOQR+R/597Ax
         AtYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo/31cee6ZfCCZTbtAnQ7GeFP/gOt9F6j7KyNVGNCRirm4aHu/0NxI5MG4vJdgIGGRt6XxIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLSGAlEVDSqJ8I1yxvyZ1zG6rDQXTTsno9UgSShA/kix7W11GI
	JsZg3DV/Hwa+pnupl7RCiqRou5ff38GoNWBX4S69G8mKsAt6hE01BNn0bWa2PnH+EouCTlx16Wz
	ft2XJ9/8cgSyUi6ENl+/T7x5Nrnk=
X-Gm-Gg: ASbGnct4GBHBnuCR44HIPRyyQ2UJSsYuv6V6+wIWbCfjxgKVrtFdzzPga+EYmV/NelA
	nUXzC+AxjGTWIdaY9TDjfRYtIB3+Tk+jY
X-Google-Smtp-Source: AGHT+IEvMXbz/ATLbtPNpdoZq7utk3jT6G8l9B0pfvfJrNTPtha9rgk1sBFORpJxaDQfmVMujvdo14mu83hAF3M4v5c=
X-Received: by 2002:a05:6902:1503:b0:e38:a34f:ff91 with SMTP id
 3f1490d57ef6-e38f8ad814dmr9422644276.6.1732534109466; Mon, 25 Nov 2024
 03:28:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com> <20241124-adpdrm-v1-3-3191d8e6e49a@gmail.com>
 <3bac31fc-57aa-4234-b10b-d48d3bbfa344@linaro.org>
In-Reply-To: <3bac31fc-57aa-4234-b10b-d48d3bbfa344@linaro.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 25 Nov 2024 12:28:18 +0100
Message-ID: <CAMT+MTSDWK1dwgMHbNxAHab5_45xDn7YTfZDUdUL5Zjx++X4kw@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpu: drm: adp: Add a backlight driver for the Summit LCD
To: neil.armstrong@linaro.org
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Nov 2024 at 09:45, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> > +static int summit_suspend(struct device *dev)
> > +{
> > +     struct summit_data *panel = dev_get_drvdata(dev);
> > +
> > +     int err = mipi_dsi_dcs_set_display_brightness(panel->dsi, 0);
> > +
> > +     if (err < 0)
> > +             return err;
> > +     return 0;
>
> Just return err here, add a common function to set a brighness value and
> avoid duplicate code like here.

I felt that mipi_dsi_dcs_set_display_brightness is common enough, is it not?
Ack on all other changes, will be done for v2.
