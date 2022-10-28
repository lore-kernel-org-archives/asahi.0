Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A91E12280
	for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 19:04:40 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1322d768ba7so7319024fac.5
        for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 12:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RtfpI9rlbOhsKpmZm1h0Bvu9a77/MRnLOJ2Qclf1R/g=;
        b=5/aTCerIih0gUopCt6gszajcPqWvr4oWuqUWlKJLwRo39juH5R9Gfd6npggcE0zquu
         Tuc8P5A1TAvJGap0VCFFrK8ZYATvvczw0AvjcKIEYPUf/x1KoMsxelpWrTwo0+j9KpCZ
         XinnXQAnWsPYDaSXlE+nH8HDimnSw7FU5hB8CtmLXJhxN0pbUfWKErfH+ZeFPz4bJs4g
         jd9YbxfKyNKlkrC0j9kE9KXdXv7dZTNE7A0kIicQMQ4CvPsOCaZCpehTpW0sg8ODWp+m
         hxMWSITIbOD/IPYdl5xX6a5RZeJLxSmSVOFKXwjT8rrAHNBg2D0kO7dQMMLzdbri42WX
         NmSA==
X-Gm-Message-State: ACrzQf2OmdBA/AX8vUqVkomJGZp/axfTPk4l/brHeVkr+ClxDhCQ9a/D
	KpWl50HDWVDlBABl1E3aIq3JR7h5Xw==
X-Google-Smtp-Source: AMsMyM6tezh5o2b4dNkYK5v+E6BduBVm+8wB6EMOaQdLqRIYQoPr5GfMlgIq26LTdQ2B28Jfk4dbpw==
X-Received: by 2002:a05:6870:b414:b0:130:ea11:761c with SMTP id x20-20020a056870b41400b00130ea11761cmr393921oap.62.1666983879570;
        Fri, 28 Oct 2022 12:04:39 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g91-20020a9d12e4000000b00661b019accbsm2022445otg.3.2022.10.28.12.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 12:04:39 -0700 (PDT)
Received: (nullmailer pid 2098127 invoked by uid 1000);
	Fri, 28 Oct 2022 19:04:38 -0000
From: Rob Herring <robh@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: krzysztof.kozlowski+dt@linaro.org, sven@svenpeter.dev, linux-kernel@vger.kernel.org, thierry.reding@gmail.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, asahi@lists.linux.dev, marcan@marcan.st, alyssa@rosenzweig.io
In-Reply-To: <20221028165215.43662-2-fnkl.kernel@gmail.com>
References: <20221028165215.43662-1-fnkl.kernel@gmail.com> <20221028165215.43662-2-fnkl.kernel@gmail.com>
Message-Id: <166698381253.2093680.6251640066817102720.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: pwm: Add Apple PWM controller
Date: Fri, 28 Oct 2022 14:04:38 -0500
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

On Fri, 28 Oct 2022 19:52:13 +0300, Sasha Finkelstein wrote:
> Apple SoCs such as the M1 contain a PWM controller used
> among other things to control the keyboard backlight.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../devicetree/bindings/pwm/pwm-apple.yaml    | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-apple.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pwm/pwm-apple.example.dtb: fpwm@235044000: compatible:0: 'apple,s5l-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pwm/pwm-apple.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pwm/pwm-apple.example.dtb: fpwm@235044000: compatible: ['apple,s5l-fpwm'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pwm/pwm-apple.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pwm/pwm-apple.example.dtb: fpwm@235044000: reg: [[2, 889470976], [0, 16384]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pwm/pwm-apple.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

