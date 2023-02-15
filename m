Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC3C7B
	for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 18:19:23 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id a10so24189977edu.9
        for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 10:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttIkva2vkaSJEn3TjnxbLiCbuCwLLNqZ7Drf/i1oejE=;
        b=i0dK4fl+BixaORy4qMshgt3rJ9EpBhEFNSiv+W7qRkyVCKFRqVcTUxhUJ2KNSA0cEA
         MA8K/vm7wXlEkiw5pOxURMJ0cQRIywRPSNQOc52WocNA0cpFjj1949dZJ4v+aUTTKa/Q
         86UAivebQO15skJypIlSFuJHHuz0PJJbLhuIz0JJozFqdPbkUlPgHfJezHZ7C1fSfgWG
         c3biNlwX88XEqu3hmjUstgty4cfHjds05KPeaVxPFMuV1slhZy7wOxY6gHYpk5Qsp/DX
         k9suVa0kGEstxEDtVPyBLPWOwa6NxHrvGfxzkrrT5xnJp74+O+xWcXgxwqwyPMTyMpbY
         +Wdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttIkva2vkaSJEn3TjnxbLiCbuCwLLNqZ7Drf/i1oejE=;
        b=L8u/VcbqqAb0+B+a6fCidKsF8rSG8DAKOLZ4SAW3uHDD8Ehq6aPyjjB3RTz/ZIu+s0
         nctFmMuj6Sx1WxL3VUIYp3rfwFJfpZrV5dn5SIMP9xVJZc7/3Gxta8Vl00zN6LoOHQum
         2/94ijl8521S4RWn9bPmSBig9Qk/An9HvU4xcLYs9tZGO3roCCwt1xGerrG1h5/K5N+P
         WV3ysfGXHV2xhB6meVY88AZl/KeQEjtvJRT4UCqz8p6ubh7Djj1P2lVYyytZm8x87EfY
         KPMarDzBbItuZzLrN9gRU5qx7U2GgKhsNhkJT/ZJtzkN9th8/K7F5qcSPqXyK32aMOW5
         zAAQ==
X-Gm-Message-State: AO0yUKVDxwH9L6A4oUrjBD2cToba3cDgPG9vF3dLpTlbtRMOaDjf2xiU
	05lmDVIJUV7DQ6SCyqazH6NkKPlwtfHcSGvCs18hLJHggr49lDVZ
X-Google-Smtp-Source: AK7set9A2nFDLZYLxfUjanDROq9ejXwSTBvh6MFd6TAptMtGbr5RJKzms5tUlWdywB1kayZeHtxEnIAAAXlrs/1cpy0=
X-Received: by 2002:a05:6402:26cf:b0:4ab:4bce:1a1f with SMTP id
 x15-20020a05640226cf00b004ab4bce1a1fmr197939edd.3.1676485161852; Wed, 15 Feb
 2023 10:19:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230114132508.96600-1-fnkl.kernel@gmail.com> <20230114132508.96600-4-fnkl.kernel@gmail.com>
 <20230215111652.lyhebfntqlibtmex@pengutronix.de> <CAMT+MTRydNiYnhBJYVCoS5iXnhr7MywCV0t7FanHWwbwv2TrbQ@mail.gmail.com>
 <20230215180410.jhontngsrb5vvv55@pengutronix.de>
In-Reply-To: <20230215180410.jhontngsrb5vvv55@pengutronix.de>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 15 Feb 2023 19:19:10 +0100
Message-ID: <CAMT+MTQLOZUids4N8Eba5SYOShPGJWqMSaCyF=cmh2KvBE3CaA@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] arm64: dts: apple: t8103: Add PWM controller
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, marcan@marcan.st, sven@svenpeter.dev, 
	alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Feb 2023 at 19:04, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> I'm not the one who will apply this patch, so I cannot say. Having said
> that, I wonder who will apply. Will this go via the arm tree, or via
> pwm?

That is a good question: The pwm driver should probably go via the
pwm tree, but the device tree changes would be better via asahi-soc.
That leaves the bindings as the, "no idea which one".
I wouldn't mind hearing from marcan or Krzysztof as to what their
thoughts are on how to send it properly.
