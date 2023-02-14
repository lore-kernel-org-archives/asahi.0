Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26481C0B4
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 16:12:41 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id k14so2183138ilo.9
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 08:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KRnihi70xYJGr/6gz5qpEvTQHwST9Fxql3Y4ntBLC5k=;
        b=EpfqnClNxKjoZlrbFpL62FYZ7tlVlOu1wOz6wsnawZgaIutodzq0UrrEWLJf//ObEB
         6hcpJlQI7C6i017Ly7HfVgIFhDFiB4sXCSyJgwa4JbS3kqOjHJ1gzeo0qWLfsKillCKO
         LZZqvfp9TBk1Y0Y7iuYMCCZgwCPDt+1c4ZK1upd5MH0t3+TcF5YSb5xCpmHvdvJi7rt7
         m5oYC50FydU5JS9tKQl6fNfVst2wsIgGMDY70fR0Sm73RbiB0n+09S3Fmp8mCuMhnRnb
         UZNzNMaT3G/tZki3X4SDe0VlV1zw7npIRL7S7Vbh9JlQxFHq1RenAwGhPEFozwAYM4La
         R1Yw==
X-Gm-Message-State: AO0yUKXOXPXeE7fiJnI3jY2ltFM1yJ5T4KHmesOa2z9CmyWKpeDJ9q95
	asmrGSvAnMrYX3hm4xU0xw==
X-Google-Smtp-Source: AK7set/cqO9Qce0mfObRTpm3vOV3ZlYDATP6SZUWsNM7rc2huKWe08aD24j9258V3kzTBmHIemtMWA==
X-Received: by 2002:a05:6e02:144b:b0:315:2d37:993 with SMTP id p11-20020a056e02144b00b003152d370993mr3450061ilo.3.1676391160154;
        Tue, 14 Feb 2023 08:12:40 -0800 (PST)
Received: from robh_at_kernel.org (c-73-14-99-67.hsd1.co.comcast.net. [73.14.99.67])
        by smtp.gmail.com with ESMTPSA id n1-20020a02a901000000b003aed100a51fsm4961315jam.142.2023.02.14.08.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 08:12:39 -0800 (PST)
Received: (nullmailer pid 76716 invoked by uid 1000);
	Tue, 14 Feb 2023 16:12:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Martin Povišer <povik+lin@cutebit.org>
Cc: Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Hector Martin <marcan@marcan.st>, devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Sven Peter <sven@svenpeter.dev>, asahi@lists.linux.dev, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20230214141053.92731-1-povik+lin@cutebit.org>
References: <20230214141053.92731-1-povik+lin@cutebit.org>
Message-Id: <167638945429.3790.16067227881981242831.robh@kernel.org>
Subject: Re: [RFC PATCH] dt-bindings: dma: apple,sio: Add schema
Date: Tue, 14 Feb 2023 10:12:34 -0600


On Tue, 14 Feb 2023 15:10:53 +0100, Martin Povišer wrote:
> Describe the SIO coprocessor which serves as pretend DMA controller on
> recent Apple platforms.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> ---
> 
> Since the schema mentions a loader preparing the binding appropriately,
> here's a PR with the relevant (WIP) loader code, if anyone wants to look:
> https://github.com/AsahiLinux/m1n1/pull/286
> 
>  .../devicetree/bindings/dma/apple,sio.yaml    | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/apple,sio.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/dma/apple,sio.example.dts:24.35-27.11: Warning (node_name_vs_property_name): /example-0/interrupt-controller: node name and property name conflict

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230214141053.92731-1-povik+lin@cutebit.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

