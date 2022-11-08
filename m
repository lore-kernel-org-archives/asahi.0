Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6F3A471
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 20:42:20 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id f7so24291170edc.6
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 12:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8PDeB4nZ2b0/kaV55EwLdKiv7+4Bjm3GYojARxweqjE=;
        b=AVqZhoAy5n+PtVAMMbVx+483gzWF1tI70Wt+diEOnr/EEFplpI0IFX1YwVIOi7rt+5
         xKjZRLDc7nKF1ln5nELX1axvNvA5KYnfEpaqcCUyQ1pFevFiis+oM1AT+lyQk3g7zHXY
         LCaPl0JSId8MgYe21cyHU2fF6H+jewXU4nMH02zBTKFcCs2BJmeM/k0IOqOeQqCcSB32
         Y6WYvyPjSIPQ9vvrFv+lQAHO3ltLKEVdP+WdsH1qA8J8GYSCb6l+9H4m2VSi05fgWWYa
         RryX9TkQXOsmrkLmuqRSFQyVkoTeXgUcRgclZKN9oXRwEyoI5GUOItPRM4ZgJNwyzF37
         S9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PDeB4nZ2b0/kaV55EwLdKiv7+4Bjm3GYojARxweqjE=;
        b=g7YvvMIAe7qcs1+9K4kF+SIyOat+fV8pRfvXlzr0FjLt8WhEn2Ziuyek3cK34yQPkV
         e3TGquDNiQUvLE79KfVlZqtN8IW02XqBTLCKgjUjnEm9XHP/+MHhOw2ZnrdSBzdhYdck
         yTUYjhbUzt5qgbxobBlpCoa8/N/A+SrvKeGDkr4xOQ4WfFk+8Z7iHr2lXDoIT4Tne614
         0Rk2PvAxIaIn1Td3OY5woU5erq8Vd9vFXIajexl5P8YrCWBtFtuy9FrY/EGmM30jQeMO
         itLd/bqCMeKPP8Tqq3BejbvrV4frBorS3OZV5/Z7mFZgbHmrxzdm/isvqp1d5bvuw2Er
         l0NA==
X-Gm-Message-State: ACrzQf22Of+HQ5NUzAsRU3uLM9jWcjJVPh1jZwP130/SySZQXyQiNE5g
	pNac8/jwtEns5HVMOXn3sgvoNTXapSFXb1BKmvNrzQ==
X-Google-Smtp-Source: AMsMyM5UacZlCRfKiRNa0kTrzT5kX7+K684naVNWV/pxq0wgKsP9jRI7CKgITH4pf2zDtNIwin7mrjQA9a0Qs67HpcE=
X-Received: by 2002:aa7:c718:0:b0:462:ff35:95dc with SMTP id
 i24-20020aa7c718000000b00462ff3595dcmr56160916edq.32.1667940139213; Tue, 08
 Nov 2022 12:42:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk> <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 21:42:08 +0100
Message-ID: <CACRpkdaPwe0igrZOnA3Q3QosySTEa9H06kdXLQMcpeEmt+hiBw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	asahi@lists.linux.dev, devicetree@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Petr Mladek <pmladek@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 8, 2022 at 5:33 PM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:

> Add a DT binding for the Apple Mac System Management Controller.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
