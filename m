Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9ACEAFA
	for <asahi@lists.linux.dev>; Mon, 17 Feb 2025 13:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739799027; cv=none; b=cZQR6bKoPHEbFadhVW+Ul3zmoPRV4octpENa2HY72ucy4KirTH4s4iZDsCv4jp8WZEblS7FzDttJK8i2zOu2rwG+xD/uw3H6ZRG71msh4fCpxiNNwuON6iJmUWOaeaB9Wfac4lLVXbU1uACVn9EPG3sxOyppQcEwgHaeKw4LsYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739799027; c=relaxed/simple;
	bh=77G+qwzoFLoNAsQ3YZKaFAwVbGfr3rRsvhGhU7TMI/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLCuFj47I2ebglJhIBnDFezYl8I4M1KlSEpf7IMiy4HjW7Ph8sizkvCxNFZBN3jDfaqNzGzQ0r8IXGFA5xnSFTk+laJgktgwEF1IHZwh3pPK6Hw3zIwhx5/w8rp9Yv4wd7na57iBmDufFakEKVLCT0D8JdDpUTdMODrzkPK12oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZR8Wd9YM; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZR8Wd9YM"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e5372a2fbddso3323765276.3
        for <asahi@lists.linux.dev>; Mon, 17 Feb 2025 05:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739799024; x=1740403824; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=77G+qwzoFLoNAsQ3YZKaFAwVbGfr3rRsvhGhU7TMI/g=;
        b=ZR8Wd9YM7XkRmgQal0dYdPPwJdTDimEN6cHSKYWW+9UMdk7YP6uYyBCPHjZ9wMpyaw
         Bffm//lK4QfwS6N0jArZd/wiGkcYqNMMShpGhJT+NrEkDWxK43IErpU8WFMCjHlfcct0
         iIoqspDOEtVyrWlGPCHjaRgq34Nf7eUrUw1JKr6XfYXp6aXs8fAS4Ryc9WK29kqT457Y
         mXpORS0pAKPQWc7D5fs9SRbFZZcNGtlHVkT14AdURecOtqUSlfwU9CEL75oOhHJ3h9S0
         wuOACky4sJ8lgCQJcvYcG9g/VepElFLgnyZ30GoFUlKJ204By6zqGhL/ixiLHKMQBDUJ
         Rkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739799024; x=1740403824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77G+qwzoFLoNAsQ3YZKaFAwVbGfr3rRsvhGhU7TMI/g=;
        b=sGkwPsrVyibkkxpmn7PGjZ4Qlhy5D9aN+4PtbVK7TfieL7gAyZMxnotmEWbpt0HSQR
         rR2WOTjQwQgS+U1dLDbjm/RWCiun4/OJ/9bv0I25v8nxe8Kj7dUTmYgDFU4OC0pp99ux
         6b8/gPUXJqpENEoDzO3YMVTQbPikcwJ2hfyXw8Pvfz0oTjvHLc0k/PRlwVtCrI50GYxE
         73H1Y9ZSoWxlzUGm1KqHyvEBA35gY2kXupVc2nxG8RM7WQUoXDYltYVnZHdb5i2M2WNJ
         ePIBM9LW59tgNc/ACg8gAxKQZr7G8bHl5XHNjUkd8yhF57xihdYLFdJ91aXZE9zB69BB
         niXw==
X-Forwarded-Encrypted: i=1; AJvYcCWBEoDx7ytGknhJdz/1ItPYa+HglNo9Zvr8veymrJU+RJJRreq+C4jj1Vnx43heab95jllxmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrlWopu2En98EyRp3IP1xYIAdA0gUdLOEIPHmcqP+NQQHztutl
	WwBZ/KkdI5He5K+Tcmx/S7ruyP8RujN5FVKGm78AlAHu0fPdx2s8xoBfITbCuAfQkW76fVPszcS
	r9xM54TYGRf2Eh7Qabc2K/1GUuqc=
X-Gm-Gg: ASbGncvpQp8UAQrvDSitrtA028WCBHzNvPS6TP+6A+WesUbfiNNI/vjPx2wFFYl7InQ
	GREg7RZCgN4mzhA1tqRRu1dNknZbvoeb6/FjKC3Q2SWyOebeuzBOhIlr6EtIgZIMDbtUQ0Y8jaA
	==
X-Google-Smtp-Source: AGHT+IEB+MJzs+GIv2z74KvmTn3I75FACBN5SxbyoNwzXh0aK5QoppHOlpFhtMuTvychYCVQsoczFA/mnvfT2jm3ops=
X-Received: by 2002:a05:6902:3387:b0:e5d:bf09:452c with SMTP id
 3f1490d57ef6-e5dc932727fmr6866952276.49.1739799024419; Mon, 17 Feb 2025
 05:30:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com> <20250217-adpdrm-v7-2-ca2e44b3c7d8@gmail.com>
 <40e59cf1-86da-4c1d-aafd-f409d8179167@suse.de>
In-Reply-To: <40e59cf1-86da-4c1d-aafd-f409d8179167@suse.de>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 17 Feb 2025 14:30:13 +0100
X-Gm-Features: AWEUYZmCQ2KktIIoXJ32NnC-FVTPM5zygmYh9xHWyp5QfVtkMZOiANCC-UiM5nc
Message-ID: <CAMT+MTS016CLK7cawdF2kKv2tpGH-N4p3rqGLBPLkPv4A=j67g@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] drm: adp: Add Apple Display Pipe driver
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Feb 2025 at 14:22, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Unless the described problem really happens
> in practice, I'd drop this workaround. There's no point in working
> around legacy userspace in modern drivers.

This workaround was put in place after we noticed x11 either preventing
the userspace daemon from working, or breaking itself. So, yes,
it does happen in practice.
