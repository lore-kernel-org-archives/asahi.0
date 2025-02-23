Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7223C200138;
	Sun, 23 Feb 2025 08:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740300523; cv=none; b=hWf+9AjHbR7EgyrDiN1k5fwePm8O7HhEAVXw1VYOpZeUqMqnj6pOOGf7lat/UXzEbQtRCp8Nxz1U1tElcW8WyXrEusH9sxeaBuTZcEGVHelRrXGqt7+nWjqz5HJjqcY54G+ixEj0vFn3aZOIdyWhFpQq2MxVlcX7YOWYKE6dq/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740300523; c=relaxed/simple;
	bh=2Uh0N6lbwnpYOuoTtrElbf/WhtpOMy65yWBJHigR/YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=attduTPq6frAev+37JdOArL55q4fR1U0DB5xDDjjpi/cd8qFTayMK3OvWTs0qeEAwMotRIK60mADAvxYQE0BdqDQnXW72KApExDp0zyq9pUXQz4oWZiQF19+cZkffWmdHxmCSldLFuUsdR+cpVNA7j2d3J30VyXlvxtW3NT6DTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcdGqMyU; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcdGqMyU"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e46ebe19489so2533304276.2;
        Sun, 23 Feb 2025 00:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740300521; x=1740905321; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CRNAVvYYeCRwQ3a1xM+1m/wJzn5pqIvsuHf0zaTzy2U=;
        b=bcdGqMyU7RFGlaFCgNJaCDjGuFURNZi/jSGxaVggF4znCCcVKB6B2VS10OcyrApF4B
         xEwlkaFmmfg9XRXzB3Nu2YzSgG79mTicokkH8i06ZwIqpq3xZlTDAaSQwHtq0twIMQ+N
         g0izb98XQKc0PSam2odZhr7c8kyN9nKytgyFbZl4A+kL7IHqy5XLroklY1SoCJ+mzAix
         5XF4G9mfAH/8K3QM+ySOocISzcV1xIJGlxemftl9yJT2iPfelXg3vM5bmBFSXUuSIk3n
         CKBQ+W4VJjDbvXt3j7sCkGACwm4LuoJC5eCzvRFErQI4XC3kx2SXjCFqbennvpUu6PD7
         CGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740300521; x=1740905321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRNAVvYYeCRwQ3a1xM+1m/wJzn5pqIvsuHf0zaTzy2U=;
        b=hqNqNBitGw6lTnuc4a6MzzlmnWTrq57MFmrRRVcwxJwwlDnirsdpOjUOZ8Bo2jwgEE
         3+nhy/0Nc5c7ro0cnRdJEEWlSsozWB3tKYJ0IswNL6h7/XO6hJDWgcrle+xu9YEkCTQs
         bJ3mBSNfJt317J2x9j27iaSTHer5Ql9iu5niCLG1sZkL7UpM8whQoxOJnW5N3+53NI1b
         59Dx6SwulNh7ELfuBM3ovxcj+90C145XYpqQ0T24E6ERcUtmpuIVCo+IjYyjZ18qkZVl
         knJ+uU8pYslGi1zaz/dQP9BNsGMiU2NbxnMNakt2iydxjQURgACfU5CfMNpp/6KEibRd
         2rNg==
X-Forwarded-Encrypted: i=1; AJvYcCU2gP1t1WASKbv/Uo4ai9BZloT3nUftEqyRseewLFH21lLcniUyMiq8yM6JbxVswya6n9Ce@lists.linux.dev, AJvYcCUesrCLTJr+Pq/5VA+IiGUDmpfk5ST8UHEA4j5yP8F19o5hRchefIYYr9HBQT3pG9/SBnuR/g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp/EzgXbrFZno9KUCAhuBmeE3/r/eLkG07kJgrbz7GvuM913SH
	f/+gdYanLTetF2xXRd5sJxcuh+VLQyFy1xePfDno17JxE7b2S/itDIWHY7ihaKEUQLrYEM6vwM/
	A0/miSOWV+i4tF/I23hscJXuHC7A=
X-Gm-Gg: ASbGncvdhDqhY4mfzEcnAs8q7tcKVZl3CgfNyFZkon9idGjoEC/h6WcuAxFRDLp6wJo
	K8DrXHtStgcc2rx/R3RgXoCSwEqoek/thh0Hvw6gn+w5E9utpjBygYLU+D5LVMyXESdbgLMSxEm
	qcHS6vLBZp
X-Google-Smtp-Source: AGHT+IHb12XReeyoJDdKwjTiybo5Sj6fWeU+stjIr25RfUjMsbR/05GXSFVxnSxTw+cp3RjuECFwksFzSO61LWq7Pjs=
X-Received: by 2002:a05:6902:200b:b0:e5e:1389:cb40 with SMTP id
 3f1490d57ef6-e5e245e7139mr6807165276.13.1740300521431; Sun, 23 Feb 2025
 00:48:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250219-isp-v1-0-6d3e89b67c31@gmail.com> <20250219-isp-v1-4-6d3e89b67c31@gmail.com>
 <20250219113422.GA26386@robin.jannau.net>
In-Reply-To: <20250219113422.GA26386@robin.jannau.net>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Sun, 23 Feb 2025 09:48:30 +0100
X-Gm-Features: AWEUYZlT7UA0f04bSLad26HmgfbyXA2dYAU1yBLaWwGCtq5yfIfuPEY4zNm_Co4
Message-ID: <CAMT+MTR4yPzC-NBLT6uLhveHFDWpwwn=hUzU6=WDc73+UVEMwQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: apple: Add Apple ISP driver
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, Eileen Yoon <eyn@gmx.com>, 
	Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 at 12:34, Janne Grunau <j@jannau.net> wrote:
> > +     while (maps < end) {
> > +             maps++;
> > +             maps = of_translate_dma_region(dev->of_node, maps, &heap_base,
> > +                                            &heap_size);
> > +     }
>
> The hand-rolled reserved memory parsing looks like it can be replaced
> with of_iommu_get_resv_region();

I have looked into it, and `of_iommu_get_resv_region` does the wrong
thing. We fill out `reg`, and it grabs that instead of `iommu-addresses`.
