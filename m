Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D7B2590
	for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 15:31:38 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id r132so8392860oif.10
        for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 07:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FZkzDMS1ZlJGneVFTqUpOfvr7Yi2qPmA1JudWoB5Wqg=;
        b=HcwTnRdk6Nf9TX5WPnXbzcr3Wic0yv+Im0LHSOZg1C7Ip0rl3qP7tcOhJWP9UGP/9x
         Tr7ok6RrBMXrg3PkvTQ+7+wFYcWdcDezOJX8gjwo1mJiukhMa5qf1g+Px8O/51j368C8
         kZ6Jw650bedJTt+1dkroQU7jrtGK8eoHS/CkTdPcTB77D3yIW04y/Zp1kStz4/AGwjQV
         jJxs0WMySRa/5pw3uCU/O/kl2jPjHZr0GIym4T39wmtvRw2Kqg9Kg9LLaGaE3cAvU3jt
         CwRgb3OP31nL9ThkgYFmNCzqOk/5CzAVOk++mn4va4wRDQM1ckh/2KQ3eJJqSOTERSSw
         tDkw==
X-Gm-Message-State: AFqh2krvcPd9G+CmXZZK03RXg+UfsXyP151iuBNImpaS9grCpG+3QUdO
	KfmkG1VEcWV3iBCeavCaxQ==
X-Google-Smtp-Source: AMrXdXs6x0mubg9C92n0oqZLWm6BQqgv4Go44B2qICGsMrS6njK5eu8A1Orc0x+NYVCJMr9qIjOXdQ==
X-Received: by 2002:a05:6808:189d:b0:364:d523:e138 with SMTP id bi29-20020a056808189d00b00364d523e138mr11734098oib.32.1674401497338;
        Sun, 22 Jan 2023 07:31:37 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 2-20020aca0602000000b0036508145326sm10737337oig.9.2023.01.22.07.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 07:31:36 -0800 (PST)
Received: (nullmailer pid 2288127 invoked by uid 1000);
	Sun, 22 Jan 2023 15:31:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Rayyan Ansari <rayyan@ansari.sh>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>, Hans de Goede <hdegoede@redhat.com>, janne@jannau.net, asahi@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20230121153544.467126-3-rayyan@ansari.sh>
References: <20230121153544.467126-1-rayyan@ansari.sh>
 <20230121153544.467126-3-rayyan@ansari.sh>
Message-Id: <167440123887.2283488.2841716718270566192.robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: simple-framebuffer: Document
 physical width and height properties
Date: Sun, 22 Jan 2023 09:31:35 -0600


On Sat, 21 Jan 2023 15:35:44 +0000, Rayyan Ansari wrote:
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> ---
>  .../devicetree/bindings/display/simple-framebuffer.yaml   | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/simple-framebuffer.yaml: properties:width-mm: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/simple-framebuffer.yaml: properties:height-mm: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230121153544.467126-3-rayyan@ansari.sh

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

