Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6DC3202
	for <asahi@lists.linux.dev>; Thu,  1 Sep 2022 19:14:57 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1225219ee46so9280661fac.2
        for <asahi@lists.linux.dev>; Thu, 01 Sep 2022 12:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fHpuoKiaP8gaOWB+xshWeNLH14khrnSZpoqLnYd2/sQ=;
        b=jQDg22+iQUeI2pQPLTYk1ohZvajyKoBFvW8ZH7SoxcGXUOLzOchLACF/4ujfkPCI8z
         OO4WEu9SUT82n9c9mCkgla9o9chhdv3iIgryT/uWIER12ugGmyh3sGKAzCI16R7VCxMJ
         c7mRPOzQAEl+fxIfUC2Cwo5gEvpn2V4VdPJt+7bf7E5bD3N+BNKs4XzZTo6Y9jpP+PJW
         tv3fkx07UerX47VkyviBKD6Ox/5Dc1vrD3u7/hPGKLBznPoTzQXyOVrQi2E9CNU1hlUW
         CndjmpqdlBwedDdW93cyheOUPzguvxxfCLxpCnUyvWnvkJt4tc6L6lJKiNtBurFzB0Ho
         gdgA==
X-Gm-Message-State: ACgBeo1Y1aGeLFsBw1sKbTxh0upkH3K4B8dYnp4kwYuQaXvXGLGS98cF
	4FB/BKeeArK0iD9YaCsNng==
X-Google-Smtp-Source: AA6agR5/5uzJNbiT4/9e04PK9Ypn0jZez6KHfkZ2dBJaXWmDx+E+aszkmLnMPoBglY+Uw6hAmCBZug==
X-Received: by 2002:a05:6808:1294:b0:344:a101:39f6 with SMTP id a20-20020a056808129400b00344a10139f6mr297182oiw.119.1662059696344;
        Thu, 01 Sep 2022 12:14:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z17-20020a05687041d100b0011b98fa9ab5sm16155oac.50.2022.09.01.12.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 12:14:55 -0700 (PDT)
Received: (nullmailer pid 2226881 invoked by uid 1000);
	Thu, 01 Sep 2022 19:14:55 -0000
From: Rob Herring <robh@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, asahi@lists.linux.dev, devicetree@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, Linus Walleij <linus.walleij@linaro.org>, Hector Martin <marcan@marcan.st>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System Management Controller
Date: Thu, 01 Sep 2022 14:14:55 -0500
Message-Id: <1662059695.085972.2226880.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

On Thu, 01 Sep 2022 14:54:25 +0100, Russell King (Oracle) wrote:
> Add a DT binding for the Apple Mac System Management Controller.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../devicetree/bindings/mfd/apple,smc.yaml    | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/mfd/apple,smc.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

