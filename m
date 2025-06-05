Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBACC23496B
	for <asahi@lists.linux.dev>; Thu,  5 Jun 2025 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129940; cv=none; b=lOJD+8ZedH05DaLp4nojCPN7jtFAxakbtTM6LxGGBebKzihWvIZQiFMuJKRpMhZ1HkzWRZT/MGj263eeU+yqL9BHYpJj0Y7jsT6+/scw1PubKkAmdXP4tpy+UAov0JGpXEZ9BvWv0zByuBX1Xy3/lQhISR7QVjdCRGg4TTrMyI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129940; c=relaxed/simple;
	bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DZ/dfzTogELmAg5kS29olE7gbrop9dqQ6/FvxmFo5StmloEKqls59nUYTmzKDtPMeDRb3Oh45Y83FwTwYZYgiKvWYfDSI3bYa24/SXRfs3mphVx9ZwR3hrCJkBXadvvgRwX0xMt0TMbweZOgdSoXZ4B/QBHsp6mv23j3BT/YwT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CXGVvaq3; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CXGVvaq3"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso8028501fa.2
        for <asahi@lists.linux.dev>; Thu, 05 Jun 2025 06:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129937; x=1749734737; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
        b=CXGVvaq3uuW32NQWCp85GzZFK6QwhawUNv+XNbKK2uqpqmQkYnslI9vATC/Zl6WFNj
         8qTu8joCQ8wfAPxEdE4wtEd3NwOH688NILHNZvbQqNedeG646Scwa8AHFZC9DHXoueBp
         QJr3ueSq/cMrsCEu+Zywjn6qZ1RvTkvBb0FwYa4QkSOKw8GredhG9mXWVxdIM6TcwmVk
         vxv2i4O3w52iUVqU6MB0M+rEQLCwGcgzfetwAEFsMRLqqRUXirUtns0sEKsmgBfat1hZ
         Nob1MrDoxnWtDYo/+7bEcwzqMvT7II26BvAfjOGHr3TzuN3JePk8vh6vI8j0GejO10Pn
         SCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129937; x=1749734737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
        b=MFEKAFTwhvrU5nrLYAaGIYSby8VgBqd4pMIhEVEN+WmvZR9AG6W6SjyFGoo3KIGPYa
         NkprnyNgE3AZA64St8/+xcX3dOZEcumewWcCV3u0xs7pZus324Y7PbqOr8ZZLbFlJF8k
         tX2vIgorEUsI0qmBElwaulEmneKL3XX0lOn7EA7O9qHLdCJOj+SSk8a2CJ3JAsNzdc1/
         mEWH5zI6EHzDEYegukxn01HqmWTt6F5adK95nHco55nen3aefYcNu2p+lXhCH9f1Y1aR
         5A8ExqqTPSd5MN1T6vm0uEZA41ejLh9ZPK9E/RZ4BScoRnTlVlRuT6i4gZ7K23271Wo0
         trPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4uc7p/1fdFPgCGCnrMPmI0I93loaluaHukwHkEh24IAGXETcPUk/5Gt+GhKuf68LrWuapwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YymAXYyQHij6i66d6PIwYjJgbP5fapjdOv5QfHidTrapvDKtdpH
	XlbY9ht7G+D2sW6tOSbKZsc7nWCpBjPcOjxcF91Xcvp6WmQlInetGBnRpVup36tqF/ZIqTRqGnW
	up40U/xfCLUbCyw3pujkU2cCQ8BnvKkEqJsIx0BpiOA==
X-Gm-Gg: ASbGncsBI8aCedUEKRkn/4qPkayQ1h3jmKIBFFYsd9DHH8RlMk845rwsHNRdmCOWqOy
	1DbRzmsyVSUKiTCGWhcow/eNkBXFpaBLq7g2oGEY/Ezh6Kuxwfm2XA6jTRqWbqrY6RgZAq2HYsO
	rWLZa829N8Vni2TfyZjgbqDus3nw3O2SIc
X-Google-Smtp-Source: AGHT+IEXDLuUxYBO7fxS8P8ms4WiU/xJFKvEp/hKMmovCR15hms9m/g0A6FghTW4kUyhFWDODOXMqMLjOLenFT8s9LA=
X-Received: by 2002:a05:651c:994:b0:30b:f283:5ef8 with SMTP id
 38308e7fff4ca-32ac71bfedfmr18601411fa.18.1749129936758; Thu, 05 Jun 2025
 06:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-36-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-36-5d75a3711e40@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:25:24 +0200
X-Gm-Features: AX0GCFsdE6ka4seBq476pc4kVds9Z70NwuFBL-Ad03eDGyeURiB9xBYNtFeP04Q
Message-ID: <CACRpkdbbwGOF6URoYtjci-muvBHUhT8pRu6JXR71n3LpicgSzQ@mail.gmail.com>
Subject: Re: [PATCH v2 36/46] panel/tpo-tpg110: Use refcounted allocation in
 place of devm_kzalloc()
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

On Fri, May 30, 2025 at 4:52=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
