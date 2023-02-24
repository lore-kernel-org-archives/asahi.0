Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E71F524F
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 11:08:55 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id i34so28053851eda.7
        for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 03:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WNMaV7WgelnPDajGIIjEuoHp/ErryWU67TwpipK+OSM=;
        b=oDuL7Ue9xH8ZoBiA5tN3w6IubU7+wQ4QnW4617I0HaxulfV2N13io+A6bRzXhBEZQl
         7mMO+lp7ZppdXTw50/Q54r4ccPFfdiGB+2HZpfJpwEWLjxAZ8CGUpcE3A3Xp6/rONF/4
         gfRhGvKefnWeRtZBQxLqnasfk4Q3rZaAPq6v2FnBfJnSuP0RGmiPr9p59TIZwaNEmS4L
         mf1JevvOczqi1Wxf7MnTqMyWF0zhXuixPw8FQxbpfxdMFEtX22SDYjYjrJxkZjT7bPFP
         MtSZwWxdC0V0idELKfYRFexjad3um+WfUdbyRBFHI0hxat1jwBlg2EG3lMBm+XP6mUeD
         bPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WNMaV7WgelnPDajGIIjEuoHp/ErryWU67TwpipK+OSM=;
        b=EIKI3Er32D5lTkbQ3wh9RlJVFsI4h6MXeCLebKuua5oUcsFv4D5HA15KGpMg3Hpzia
         WZonP76k0crlTlVMwsLpzDMdsUBfYmg51UpnGrccMBKyunzcxuYQhJProNz/NUQabUJN
         jUQLcvogFNdfwRJ2c+6fhzLML3Kkwm/4wt1BzeknAbvbhbLejn7oOUqE3QYfxOlm+HPd
         NkwJwjFChFPBo/ZbcGl1OuQsAAOx5+XGyK8X6HUrC1iVlaAcWvnGWyg4OSr+vkuxz1II
         MGGYrZahKLXUQgtokBn18gPj9cDCOemGSUkQhqJuDhasBjacIyoGx3Su6yFk+IKKZ+hF
         KcSA==
X-Gm-Message-State: AO0yUKXO4glkn95oJ1ABQoZAtlhORefK952ZSBuSmYDcBEZGtH9YYBIX
	C0qOUy80EzXMnbMlFOZy3Q8NXl2KBVfyYFOrzic=
X-Google-Smtp-Source: AK7set/mimyM80YxsFoZxkhOgklb1+pkk/5rW4IWn20z4RKP/YfJqx8WEPI4Y56SKGrPc7yIrLZhMgLzLSVoksJ3Of4=
X-Received: by 2002:a50:8a92:0:b0:4ae:e606:432f with SMTP id
 j18-20020a508a92000000b004aee606432fmr8210069edj.0.1677236933400; Fri, 24 Feb
 2023 03:08:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com>
 <20230223-z2-for-ml-v1-1-028f2b85dc15@gmail.com> <e26318db-77b1-4876-8a40-f707d11b5857@app.fastmail.com>
In-Reply-To: <e26318db-77b1-4876-8a40-f707d11b5857@app.fastmail.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Fri, 24 Feb 2023 12:08:42 +0100
Message-ID: <CAMT+MTQ0bZiGpEFK9w3zncB-ZcCLY_tp1d5Wc0MJUMjWqc61jA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] dt-bindings: input: touchscreen: Add Z2
 controller bindings.
To: Sven Peter <sven@svenpeter.dev>
Cc: Hector Martin <marcan@marcan.st>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, - <asahi@lists.linux.dev>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Feb 2023 at 12:04, Sven Peter <sven@svenpeter.dev> wrote:
> Now that I thought about this again after the brief discussion we already had:
> Do we even need to specify the device name? Is there any reason we can't just
> always use something like "Apple Z2 TouchBar"?
A similar protocol is used for primary touchscreen on idevices, which
need different
userspace handling. This is to make the driver potentially useful for
people who run
linux on checkra1n-able devices.
