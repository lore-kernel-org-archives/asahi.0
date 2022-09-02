Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29259110D
	for <asahi@lists.linux.dev>; Fri,  2 Sep 2022 09:42:19 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id og21so2764504ejc.2
        for <asahi@lists.linux.dev>; Fri, 02 Sep 2022 02:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7RVxKy/7NAGOaBeicY+wPpYYEBXyRyq/rxV9WkxurLc=;
        b=t5MAHakXGCxi9EzKBEp8YrERVHmy6pFRk58+CBrN5EjND9wsClk17Q0nsbbYkvAhS2
         ZTMfzJ5dRLrvlYkoGBwqOlTvaOFKdPP84LgYesx7KfqWMhctqEXExFWdl21Az0XQS8tg
         uxK7evYVqfY+74N5Hqq5BciG6CPBfdKeazeAD2G+/5+gvt6xOjZw0sZeO0kXehvh1h7+
         gm9BEI7E/sQ+7LDikGIjcMX2Hl752X9at4k3GlTDzO+rOkHAFwxjhH5nUl01yoeh5I06
         K1U5VSA2gtsiIPiCgzGpzyJW3EBbnfsR2iQFb01OD6sUpNTNIJArMEBiaa9flKclDr5C
         RlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7RVxKy/7NAGOaBeicY+wPpYYEBXyRyq/rxV9WkxurLc=;
        b=UQvcWhGpKlq6nxXO+6gCFXq77BsRpSVslhUsgYiXdAGfVx5tcsyIbo2wOoy8OrFrNE
         KGFWGaT+xiuZDdkkeUps+tvVNV7dGFQVc6tP3+3VzE2OWHDRJzpkixJXOXt1zajcfBHc
         nS5NfzAaqCHPIQFLqHcsOGpQMphnsC8M6IULmiGci14PmZLRGO7fcxLT+rn3DIYMo3Bc
         TnVd+MhioyZ+7Gmb+fyzp76i7URSyH8wp2G9DE7ff4UnmDxFh/cOTYVuqfVYb86sbHQR
         nOINAlcyGLPyZMWEeJ0PAAY0LH7bspHaVMWLrSMH9saO6erEFgmhUzTdWsDVxw1urxHu
         +XXA==
X-Gm-Message-State: ACgBeo0KBA8VPiCUwdvymKGqiNCpM18QsKqWpYQXApQKX/y4oUGrNW+R
	dEINVxRsTahVbOgMr+iD22hdbYvmqVncq+t92pHZ8Q==
X-Google-Smtp-Source: AA6agR5FNn2SdvXJheXgW++QRRzppsx1/2cO8qkL7nCfiz48tHzXXaKQNTosX51dACVMFHkUCLXidwkeIGtP5BM4lG4=
X-Received: by 2002:a17:907:6293:b0:73d:b27b:e594 with SMTP id
 nd19-20020a170907629300b0073db27be594mr27254666ejc.526.1662111737397; Fri, 02
 Sep 2022 02:42:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 2 Sep 2022 11:42:05 +0200
Message-ID: <CACRpkdZDWn=Pw=QnO5=TP=KfT4Q8Eot3yCp7NVLmDTwWg39Zvw@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 3:54 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:

> From: Hector Martin <marcan@marcan.st>
>
> This driver implements the GPIO service on top of the SMC framework
> on Apple Mac machines. In particular, these are the GPIOs present in the
> PMU IC which are used to control power to certain on-board devices.
>
> Although the underlying hardware supports various pin config settings
> (input/output, open drain, etc.), this driver does not implement that
> functionality and leaves it up to the firmware to configure things
> properly. We also don't yet support interrupts/events. This is
> sufficient for device power control, which is the only thing we need to
> support at this point. More features will be implemented when needed.
>
> To our knowledge, only Apple Silicon Macs implement this SMC feature.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Overall this looks very good provided the SMC API is fine
with the platform/MFD maintainers, I like the usage of .init_valid_mask
which is used just as intended. Andy's detailed review points
should be addressed reasonably after that it's:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
