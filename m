Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B286A470
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 22:30:10 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id cn2-20020a056830658200b0066c74617e3dso9194924otb.2
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 14:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kj6QYdjPI+Mq4cfZXxle0k51SIZ4UdpD/shGFJqOIiY=;
        b=CiHNLUMXZcTzl3zBblIuO2F/DfjZCVbHMQUH7UtSYOniFD/AlJ/6ed5JOa4Ji+8z3Z
         N4c+TCikksLCA3Pvv9jgC2DChZyaCbh5JClfEGfdua6KjQP+HRb3h17OE2UBs1QfvTWO
         ZS7PjgVvll+R/EZ6zo56GFP7L3+zCVfQJZ25NO5mwvW8Sv9WgAz1sKvbpFUZwHkBEFGM
         MLfDz/8Mg8dEcpNrMBXysAju7i2sC0HmrYkp5Y8XEjjgzOp+b+rJtlW1sxuYZpntaein
         aCvPw5fBOLdmvjS2dkpSCK6h23PnKCyRCtzOHt+IqB/FC3nZiLEBEjSa3/Z9lLL2VFv9
         BEQA==
X-Gm-Message-State: ACrzQf03o4y49arAnPiGpPQ9Us16zcsG4fkAfOnuPzqjv9iHR90IGKXZ
	HejfL4Ub2d3EjDBUHUmLuw==
X-Google-Smtp-Source: AMsMyM4w+Q0bbTEoYWhch8yicb0YbQQFv0vfYscvOAojHPlu4xud6CxfcJeuZdXmpshPM5pW0gSwWA==
X-Received: by 2002:a05:6830:628b:b0:660:d639:f380 with SMTP id ce11-20020a056830628b00b00660d639f380mr27602176otb.181.1667946609236;
        Tue, 08 Nov 2022 14:30:09 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y36-20020a05687045a400b0013ae39d0575sm5230025oao.15.2022.11.08.14.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 14:30:08 -0800 (PST)
Received: (nullmailer pid 4095484 invoked by uid 1000);
	Tue, 08 Nov 2022 22:30:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, asahi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Steven Rostedt <rostedt@goodmis.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Petr Mladek <pmladek@suse.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>, Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, linux-doc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <E1osRXi-002mwL-UB@rmk-PC.armlinux.org.uk>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXi-002mwL-UB@rmk-PC.armlinux.org.uk>
Message-Id: <166794645522.4092185.9292599131300169784.robh@kernel.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: gpio: add binding for the GPIO block
 for Apple Mac SMC
Date: Tue, 08 Nov 2022 16:30:08 -0600


On Tue, 08 Nov 2022 16:33:42 +0000, Russell King (Oracle) wrote:
> Add the DT binding for the Apple Mac System Management Controller GPIOs.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../bindings/gpio/apple,smc-gpio.yaml         | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/gpio/apple,smc-gpio.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

