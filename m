Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ADC2F24
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 19:20:01 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id c15so13852747oic.8
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TijPrW01SusPeqgU93zj+PaZJEliWbkmIJHGZ7Gw5cU=;
        b=701kV1Y9xQF97hBF/cXHT+nbKSBKtcX9fcm3u+NRFI6v8T7XWAzFAgTURebV51xm6I
         y4t+SLwM+Qndhx89BBrqGO7t5ot8rgWEHcfe11qoLw5+KLDx+cDYdxsnnt5HVWtgmyTy
         5bplOcqod9fHTyo2YEcD/oWcu4QU2yV7FXRnrE5p1AUgB2AZ20WL/e2pHN3+LovrNTf4
         Iu7vH1DzxPObpEnC1wwG42Ciue/2fZHCpfNkwn/2ODlvC1MGFGQ3GlAfUGfBU9WivYd+
         wretBKHXUdNPkVvOQdM5Xd/A8PuncQ8ufIHXV4OMg9l6HM1SvtQWT9P55K7EA8LVQJaV
         R4uQ==
X-Gm-Message-State: AO0yUKWEmApOACkzUm9Dz6Aw8eX7XuTCWJxiL5IlLEbNMb5PQ5+6CWUr
	24+42B0pmnjsHhNgrrvppQ==
X-Google-Smtp-Source: AK7set8fynAn+e3iL12R+/VtBADDsvcxd4FgY3dUEG466kszj/Jl1DLq6tDpbjBnNxuG9Os1CQSfPQ==
X-Received: by 2002:a05:6808:4285:b0:378:7234:bc46 with SMTP id dq5-20020a056808428500b003787234bc46mr1690381oib.44.1676402400689;
        Tue, 14 Feb 2023 11:20:00 -0800 (PST)
Received: from robh_at_kernel.org (c-67-162-147-231.hsd1.co.comcast.net. [67.162.147.231])
        by smtp.gmail.com with ESMTPSA id b13-20020aca220d000000b0037d743b5cb7sm4318528oic.17.2023.02.14.11.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 11:20:00 -0800 (PST)
Received: (nullmailer pid 29522 invoked by uid 1000);
	Tue, 14 Feb 2023 19:19:59 -0000
Date: Tue, 14 Feb 2023 13:19:59 -0600
From: Rob Herring <robh@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hector Martin <marcan@marcan.st>, devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Sven Peter <sven@svenpeter.dev>, asahi@lists.linux.dev, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Subject: Re: [RFC PATCH] dt-bindings: dma: apple,sio: Add schema
Message-ID: <20230214191959.GA27025-robh@kernel.org>
References: <20230214141053.92731-1-povik+lin@cutebit.org>
 <167638945429.3790.16067227881981242831.robh@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <167638945429.3790.16067227881981242831.robh@kernel.org>

On Tue, Feb 14, 2023 at 10:12:34AM -0600, Rob Herring wrote:
> 
> On Tue, 14 Feb 2023 15:10:53 +0100, Martin Povišer wrote:
> > Describe the SIO coprocessor which serves as pretend DMA controller on
> > recent Apple platforms.
> > 
> > Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> > ---
> > 
> > Since the schema mentions a loader preparing the binding appropriately,
> > here's a PR with the relevant (WIP) loader code, if anyone wants to look:
> > https://github.com/AsahiLinux/m1n1/pull/286
> > 
> >  .../devicetree/bindings/dma/apple,sio.yaml    | 129 ++++++++++++++++++
> >  1 file changed, 129 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma/apple,sio.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/dma/apple,sio.example.dts:24.35-27.11: Warning (node_name_vs_property_name): /example-0/interrupt-controller: node name and property name conflict

This is a quirk with how the examples are constructed. In any case, just 
drop the 'interrupt-controller' node. No need to show providers in an 
example.

Rob
