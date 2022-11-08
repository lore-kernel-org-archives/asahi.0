Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A45A470
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 22:30:08 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id n205so5972285oib.1
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 14:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WVr22nk4SndJ8H66JU2yibJo3CMhTG//flCyYnxoDWc=;
        b=NCKwSpI+EZUpBN3C+DINSxTz2mtK/Lu8NRfKZjkbIvlFyGIy+dHjIpBn7z2jw6qokS
         7CRlkufncoucNFzKlAucq+Rzos5N82t5MDL/XW7T8ROZE9SDmSCdvBvGKA1E6B7vyhEp
         4erkAlNqzym/FTR0kG73K+/2BhtHRbjk7YHo612PpccG4K2uDLyLz0ivVMJvKVRfk6YA
         puH96jjrW7ocBaHY52YZw9c5xfER/vSaxz8d+ONXTPKrzm0XQKludvUPZBjQ4KWZ0wFH
         6WhU7WT1ZmpyvbKdjgDgxs2PQdDYTJLSuzy9kG8+Q9pggXYVScbSjhiV8AGlCLWq/cs/
         tyRA==
X-Gm-Message-State: ANoB5pnp2pHCS0NtY4EnBAQf8m5SQ9l+BTWjYx3yTBWEEggtLpnmFPJ9
	YikB69uqQzMKbHl6zuBc4wTvs8KgZA==
X-Google-Smtp-Source: AA0mqf6RlGieEbcl+dbrT/D28zOgZua9hO0IvxHXERfgLyfC27jlopKZRm2zIWGtIbWYsCWz7LHTjQ==
X-Received: by 2002:a05:6808:d52:b0:35a:83c5:d8e2 with SMTP id w18-20020a0568080d5200b0035a83c5d8e2mr7905378oik.160.1667946607517;
        Tue, 08 Nov 2022 14:30:07 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s41-20020a05687024a900b0012763819bcasm5224061oaq.50.2022.11.08.14.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 14:30:07 -0800 (PST)
Received: (nullmailer pid 4095481 invoked by uid 1000);
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
Cc: Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lee Jones <lee@kernel.org>, Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Petr Mladek <pmladek@suse.com>, devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Sergey Senozhatsky <senozhatsky@chromium.org>
In-Reply-To: <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
Message-Id: <166794645363.4092121.5573869968792780468.robh@kernel.org>
Subject: Re: [PATCH v3 3/7] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Date: Tue, 08 Nov 2022 16:30:08 -0600


On Tue, 08 Nov 2022 16:33:27 +0000, Russell King (Oracle) wrote:
> Add a DT binding for the Apple Mac System Management Controller.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../devicetree/bindings/mfd/apple,smc.yaml    | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mfd/apple,smc.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/apple,smc.example.dtb: smc@23e400000: gpio: False schema does not allow {'gpio-controller': True, '#gpio-cells': [[2]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/apple,smc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

