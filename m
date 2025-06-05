Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC3D1EB5DB
	for <asahi@lists.linux.dev>; Thu,  5 Jun 2025 13:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129880; cv=none; b=V3Ac5wtfSuygSVhj7rd+f5dmv/8xIMt3ylqvLmuBielJ7WQh0C9PylDLyM6f8BQz2UIIDuQXDyfEsxbvwCXQxslND9DOn0TwbfNlNL3yDA67vihHkcloCadbDW6ifEfEXYsgGTuMkVSXppNMfT5wEuJ1bhtavxv5nMX2pWuCNug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129880; c=relaxed/simple;
	bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvxYyPrdPrPV4H9FGdWoAwLsGeBY+Uzg7+1Jn/oAf6Pg5mfFqrZ/aq2q+x7BEP0oIfdD7bSMW983Zc7J49giON6gu/KdT7Mv7a78h6JCPc1bLhHXX/BRRt5R/LBay3M7lOPfrIG1mGg3qUUx4quhbaopEgYX8TqNa1yKNx4yfig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ieWjVpwS; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ieWjVpwS"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55351af2fc6so1269377e87.0
        for <asahi@lists.linux.dev>; Thu, 05 Jun 2025 06:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129876; x=1749734676; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
        b=ieWjVpwSugX1UXb0nIWJQyG0m+JvBVo/aGrhBX818gakThBeD2omjoe/nLIwIqxcN5
         5eBG19GwDQ5nOfGIE9yLP9a5bMoNVtmli8bElctAy8RX/yOoP/9A7cYndAyU9tttnb4T
         VFJY7+vM9JkPd5gV8OesiJ0v230iDnfj6LzEbe5MFK1uPvNaGg3HyguvLr1adP+vIh6n
         Dx+KMu/AuYxYFTSwN+z3kzu8N23aMXrJtDIi9z2hg8LeAxhKU7glJy8gtltELuDGi0yN
         IJDIJPshOe28IY52kXZXimHV5lNExqOq1UFTWw+tQy5F6ArPyW9BMr2+7TQlQdrT2Kb1
         yFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129876; x=1749734676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
        b=Dik3X/OPurUhyzL/ea8FqGU8aAxIYrV5943/H0w6HA2e6N09aTbXTeu5HfBJy5Ojdf
         BefQ4PWYfjLFHnKO0hUeUMjo7S3vq0wNLFhswm/aBlAv5gHd8hdeT27LyMPlldHSX+CO
         MIAh8X8N1E1fubDVvPsz7k2m8Mp+XwdTr2ktyH3UpdQRtULqruquMKBZBmeKM5VnDVVv
         qLsVCvlHCBhlh1u5FI31HmWo/1KJSjYWb3gMfKBedkc+Z6hS6kRPX8tdhtIHAxdpgY/J
         tCdOLcWl4lZ3IdP7FTdNvLrI5q0eFcAwJs7TgLH+fzFi58GS1UribBbiWD4DIS5AyZKl
         nYJA==
X-Forwarded-Encrypted: i=1; AJvYcCXtbdxjyR1S8cY4aHeJLcf+l7IgPbrtgKw1vrMlA9zSYmtyNqIbcmOZTIZaVxnrsqkBc9X/FA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYaB0R8fQraJJl7Rj2OE1UYjx8AVfd6Ko+6tr+dLCMcZeB//uL
	J3DpDpBmUxlSGVVE2ODvz9syFf/GRs8k1LUsnJbV8Jb/RzMn9gcOxftlOy3e5klGl2t6CgvGoAN
	rWjJ3DqUpA9gyW1TzSOXvllfPWgl+TMjsuv1TlESkeQ==
X-Gm-Gg: ASbGncvGhYGTtnQbpuRWRUFqCN7V8sP4LAqxXUbxlXYTOHzoUin+SvQwxgysiIQ53Vg
	/VI9zHbiGHB56hcXUmgpD/rFL98kWPOnnRDeOhkWRxaixbb7iEvYlOwxN10mFjV8b+FhjCAa1wo
	n+XQJPz5GuflJ+W79iDtHy4Ayz8eBVRPsv
X-Google-Smtp-Source: AGHT+IHcFKkR1DgTHybFc9+cXkjDfNRWO9Y5rsQ/Vs78BAkzeGllU9ZiczF0eVkbFtRkeWxN8XAgTwUOdn8ciwJ5GKY=
X-Received: by 2002:a05:6512:4011:b0:553:26f6:bc01 with SMTP id
 2adb3069b0e04-55356e0492dmr1902010e87.53.1749129876416; Thu, 05 Jun 2025
 06:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-29-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-29-5d75a3711e40@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:24:24 +0200
X-Gm-Features: AX0GCFv_P_oe8_LfoK0HrETyIz_pn_ODXYaiFB7vtLAilhJTNSsv4UaB2RLH_HU
Message-ID: <CACRpkdaFYcvq+XsQ6FocXqW-gnoP+66CL4hTiSQ=w0fc1jckig@mail.gmail.com>
Subject: Re: [PATCH v2 29/46] panel/sony-acx565akm: Use refcounted allocation
 in place of devm_kzalloc()
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
