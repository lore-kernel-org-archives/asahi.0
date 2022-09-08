Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A037C
	for <asahi@lists.linux.dev>; Thu,  8 Sep 2022 13:29:57 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id lz22so17206684ejb.3
        for <asahi@lists.linux.dev>; Thu, 08 Sep 2022 06:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=PDuAPZrpPEtZS68Yxx+kwA9YlOfP3w3tOQUXiw/qzS8=;
        b=QH57RwMVu8vMSoQCu6D5f9wGqQlvcOcmb4CopxZrOhkFCWLbwJ6AOwCi0TTzqbNsRA
         cBJMO3DjLvPIPMLbAL+8736YVIyS6wv3WRZ/0DXmx0DCWf5SeffWDFdEenHY1bTY+LPk
         7TO1CeDgQMhSHrZi3G1sdNaDAjHhpQr2EET5Q9aAbm7LsPqInO24KZi6tAVjKw65jd2i
         FCK1JTYESyuAYtTOYvp5qht7U02LmNdSDveT2UlQPw0kP5uRiFqf61QkdOoyg1XZnWNm
         /7/ISSMyI1NbbedTVgrPhfw1wBHBxTS9jXPP2GbE+qXLjpx82IhMf5mfq8xn1AdW7mvb
         YtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PDuAPZrpPEtZS68Yxx+kwA9YlOfP3w3tOQUXiw/qzS8=;
        b=dFgRs4PuWXcmnl48SSESuPvbYKX8ZT5NvS98yL8hL3kkadgh6+dYoYOoZzV4+D4aZP
         5iz0GivcqSx2ZVTEzvgSB/LtHu1RATQ8NSsHjIOWLAGj9IUjVqQu5EClzXW0w0NRKo0n
         k+AoKVyWMTicI5QME06mmjRjFA+YFgTPNDEvvg6e9k2Bwsx7SGrto8IUrLTbjvs7Vc2L
         5o4Txl0btwJjobALKPSGkqsA1KdJJiw1BddxBIrtsXLvgt8R/Fnmu6j/1ncb4kvsyAxC
         duXBBSSLYHi2Ygcqd9GPIlJ0cRI0WJvSEEno4NrmzeLYV5CBCEEUWyuU7FBYvzvg7rC0
         p27A==
X-Gm-Message-State: ACgBeo0OgqbSAgOD/8f8wN7a0nlv4Skf600tWjI/Lg68+SjPFXq0vW/F
	Nru7ZDNWLNk6HJ5/Z3rk2JlAwEEcX5nbll7F8l6wbKjnm3c=
X-Google-Smtp-Source: AA6agR7zssRGYnqc5tnQE6Pq9ZVgR66W//Jr1xQ+ados38ww6SnvXF3vj7pDozd5PzloL51ZyUnMbu/bJsxChqtBddg=
X-Received: by 2002:a17:907:7242:b0:741:770b:dfc6 with SMTP id
 ds2-20020a170907724200b00741770bdfc6mr6050505ejc.203.1662643795629; Thu, 08
 Sep 2022 06:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
 <YxnK3LeyfacKssLT@google.com> <45ed0a37-60ac-3a06-92d1-6b30e18261ff@marcan.st>
 <YxngtlhRLTVBw+iW@google.com> <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
In-Reply-To: <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Sep 2022 15:29:44 +0200
Message-ID: <CACRpkdZpu-3gOEsXBwdjcdTEqNz4MGn59gZX0Mkdy+-+Be7LPQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
To: Hector Martin <marcan@marcan.st>
Cc: Lee Jones <lee@kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 8, 2022 at 2:58 PM Hector Martin <marcan@marcan.st> wrote:

> > If the MFD route is the best, then you can register each of the
> > devices, including the *-core from drivers/mfd.  Grep for "cross-ec"
> > as a relatively recently good example.
>
> I think cros-ec is similar enough, yeah. As long as you don't mind
> having the core codebase in mfd/ (4 files: core, rtkit backend, and
> future T2 and legacy backends) we can do that.

I'd even suggest its own subfolder under MFD, if you already know
that there will likely be more than these 4 files.

Though nothing else has a subdirectory in MFD right now so
maybe Lee should approve of that first...

The obvious upside to using MFD is that it has an active maintainer
and patches get reviewed and merged swiftly, whereas
drivers/platform is usually managed by SoC and x86 tip maintainers
and what not.

Yours,
Linus Walleij
