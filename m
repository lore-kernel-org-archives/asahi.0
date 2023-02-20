Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AC38BE3
	for <asahi@lists.linux.dev>; Mon, 20 Feb 2023 23:40:42 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id c2-20020a9d6842000000b0068bc93e7e34so484285oto.4
        for <asahi@lists.linux.dev>; Mon, 20 Feb 2023 15:40:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ekp/l7dS7L5c5Y/xNxbb/NDW4G4Mm3+q7ub7U8gNFqI=;
        b=R/VSokGNzuavJQ2ky7GggrdZk3wrryMzKmj8UMzIhl2ZxqEyBunBAgyw/awBARQWVy
         5iSBgWS3+ahIZZlHbjbNuK/G8AeQnYlse1KSCBM1u9hCmiEagQ1TaFFsno7kjdrx8Aob
         VhamH1eSD9ehkMmozXPgqipPsCkV1nwjpjBMW3y+hf0tqyNjdhR4Gak/7aLgFKYykvjt
         Ae369WM0Vj63cZRhU66c6hYkaU5lx+JqYeOMNzkiuwxQa5hVM3sLb0W2Tn7zuKqzMBpO
         u0qXsDNLuF6VhrAlCLTpEThVPuFyt1HuYNQnoVY69AT3gImRgtfbAzCOQ4PeHWO4XxZE
         bl1Q==
X-Gm-Message-State: AO0yUKU/0HcF99wHOl3k68OiUZevw7s70apwLw2ffoICuWBULIOq8VKB
	TXsvMyXxO4ZkqlEhWdxmaw==
X-Google-Smtp-Source: AK7set+WhIJJXW3KarE7h76hVttihFyNtPia99NTQYAWUZQR15okea5lUnoGuYWWkVtOk7sWd61lBw==
X-Received: by 2002:a9d:19a2:0:b0:68c:1c0d:ab6a with SMTP id k31-20020a9d19a2000000b0068c1c0dab6amr908337otk.13.1676936441767;
        Mon, 20 Feb 2023 15:40:41 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d2-20020a9d51c2000000b006864816ecd9sm726939oth.59.2023.02.20.15.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 15:40:41 -0800 (PST)
Received: (nullmailer pid 614054 invoked by uid 1000);
	Mon, 20 Feb 2023 23:40:40 -0000
Date: Mon, 20 Feb 2023 17:40:40 -0600
From: Rob Herring <robh@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Janne Grunau <j@jannau.net>, devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, asahi@lists.linux.dev, dmaengine@vger.kernel.org, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH v2] dt-bindings: dma: apple,sio: Add schema
Message-ID: <167693643966.613996.10372170526471864080.robh@kernel.org>
References: <20230214203637.43630-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230214203637.43630-1-povik+lin@cutebit.org>


On Tue, 14 Feb 2023 21:36:37 +0100, Martin Povišer wrote:
> Describe the SIO coprocessor which serves as pretend DMA controller on
> recent Apple platforms.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> ---
> Since v1:
>  - formatting fixes requested by Rob
>  - dropped provider nodes from example
>  - added 'memory-region' items range
>  - tweaked 'apple,sio-firmware-params' description
> 
> Since the schema mentions a loader preparing the binding appropriately,
> here's a PR with the relevant (WIP) loader code, if anyone wants to look:
> https://github.com/AsahiLinux/m1n1/pull/286
> 
> 
>  .../devicetree/bindings/dma/apple,sio.yaml    | 111 ++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/apple,sio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

