Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B11F23A5
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 10:14:28 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-51ba4b1b9feso156070877b3.11
        for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 02:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m24dMml2jSsL7Dl+CG8vq6QyqBxUdcOiPSlfJt9P/gU=;
        b=dE2vgPahqJN7F/K1m9ROLqCom5+Eovp9L8bfNcPdximbdKLGcCyli9VhHJJ6scj4ng
         avy/w/0zSP4GRNmvUk6hcT+Va2/KMge2BIxpA0RYQEUbvCMw9fPLXtWUEm0Ry6jHZ8So
         E5TDI1o+5iJkkRvMIrc/Nv0bf5fh64ST0ifoQ1hA4XOnulMD/m/8ofstgAXaHgfxxWJG
         S2c4k0ZhFOD/c4lqig543GHI20z+6VNiE6d9paWKFiOh/pQmg+QlojRQ5f14stuLyCVA
         sunw43YfiiXnapdsh5eTnhUuJ8h0L1wQDftkz+XE08sOwEfwAXyY/WchXmYdRGC0Rb5t
         y0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m24dMml2jSsL7Dl+CG8vq6QyqBxUdcOiPSlfJt9P/gU=;
        b=AxLwJTyG1Ozs/O33M3Oyl26+0+LpN1gXrw3oXB8I4KkPq0wv7bj1upirAqMZ8XAnSk
         s1iVdK9KlwKTmogiJc0NwHDWQNq8DRvZwFzABLziHOfXQzd+0WUBnrLi1ywZgjsUaxmV
         LG107HxcO0qLuHvhDMGD7CDDEGq4n4sNEstJS9/U8f4+pj4AZJF0HvZMNG4Evn1AviFE
         XM/Hv9T89gFhadfXLYu3M6G1+VH1ehfpnXn6fjT8QkoKvf76JcEARYl1LjjfUOgoHgBo
         YLRJjFlkA3EnD0TwEbiUiAaF/EXSKeoZzeh+usXLVfNrb8EL4bC8JrdYWFAYx69OiOWA
         CanQ==
X-Gm-Message-State: AO0yUKWZQzw9yy0c8rJNY4l1E0D/ESGofNDfX9LwCBiWmWe/6bVQ/Eo6
	ADUl7xvmXkQDs2YgN+7/GPRrXTyc6QMN2zJpSDYdQA==
X-Google-Smtp-Source: AK7set+LuEjq0hGS8kTkbDCf7Aen0jDGWuexoGHd2jNkgiQU/80/rPS3PmbPLavbhwF7RZcjpke/lJUVBzgNfpa3fRQ=
X-Received: by 2002:a0d:f804:0:b0:527:ad38:2c5b with SMTP id
 i4-20020a0df804000000b00527ad382c5bmr3046509ywf.336.1676283267256; Mon, 13
 Feb 2023 02:14:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net> <20230202-asahi-t8112-dt-v1-11-cb5442d1c229@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v1-11-cb5442d1c229@jannau.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Feb 2023 11:14:16 +0100
Message-ID: <CACRpkdadj1Jwh+XwbEvzsULOo2vaKX9ioJVw3aekRbPB371A_Q@mail.gmail.com>
Subject: Re: [PATCH 11/17] dt-bindings: pinctrl: apple,pinctrl: Add
 apple,t8112-pinctrl compatible
To: Janne Grunau <j@jannau.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Kettenis <kettenis@openbsd.org>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 12, 2023 at 4:41 PM Janne Grunau <j@jannau.net> wrote:

> This new SoC uses the same pinctrl hardware, so just add a new per-SoC
> compatible.
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
