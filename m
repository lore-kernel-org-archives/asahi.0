Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8AC468D
	for <asahi@lists.linux.dev>; Mon, 26 Sep 2022 19:20:44 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id r125so9457090oia.8
        for <asahi@lists.linux.dev>; Mon, 26 Sep 2022 12:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ADvJyP56wHbSxc129KlmBq1wxQ11OvIcsy3rVQbt0AM=;
        b=gHD1mKDEMYXhuLnWCWwqwpSVCZugm7LUjWh2kaFrq8392sN87QjnAAG/8mwjHI4ePX
         q5yF4EO34n66G27D/31ZqryHKr3vl50fkw3MAHC2AMYbhm6VmKabA4+OwP96t4glOQKK
         0xeF4BROvHOYbEoI17In1CIfO3WBUdZPZjf71L/mlKRGh3hMAasp7+sk5Rd5b86L3yb9
         l6qh2HG8HNlJx/KeTrolbPCpPdu8aaGP7Rc+l0MVGv5jpF0KEOuayl6McMEBe9DTlUgy
         tDu90hYv8j6+nkbwNyw0VyoF+QbNLPqZNx4eS74VyZFx+I+Od+H/2FwSfBzx8LJ6GH1E
         nGSA==
X-Gm-Message-State: ACrzQf3dsflETF7SUKhiJL2wYJsI69zsvW59DH6DAAwqz30kh0ptqP8m
	aldNQ2Wjh4z0tqNPcN8ucw==
X-Google-Smtp-Source: AMsMyM4ROdDjV6GTDIC7rGrPJZId6RQc+iAMicuKSsRckR/ihD7ZKbUwPWuDfXhBc1jE8xBvdfnQGQ==
X-Received: by 2002:aca:aa97:0:b0:34d:83f5:4a5 with SMTP id t145-20020acaaa97000000b0034d83f504a5mr144441oie.146.1664220043920;
        Mon, 26 Sep 2022 12:20:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t9-20020a05683022e900b0061c9f9c54e4sm8144004otc.80.2022.09.26.12.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 12:20:43 -0700 (PDT)
Received: (nullmailer pid 2629975 invoked by uid 1000);
	Mon, 26 Sep 2022 19:20:42 -0000
Date: Mon, 26 Sep 2022 14:20:42 -0500
From: Rob Herring <robh@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>, linux-bluetooth@vger.kernel.org, Hector Martin <marcan@marcan.st>, linux-arm-kernel@lists.infradead.org, Andy Gross <agross@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Eric Dumazet <edumazet@google.com>, Johan Hedberg <johan.hedberg@gmail.com>, netdev@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, asahi@lists.linux.dev, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 1/7] dt-bindings: net: Add generic Bluetooth controller
Message-ID: <20220926192042.GA2629908-robh@kernel.org>
References: <20220919164834.62739-1-sven@svenpeter.dev>
 <20220919164834.62739-2-sven@svenpeter.dev>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919164834.62739-2-sven@svenpeter.dev>

On Mon, 19 Sep 2022 18:48:28 +0200, Sven Peter wrote:
> Bluetooth controllers share the common local-bd-address property.
> Add a generic YAML schema to replace bluetooth.txt for those.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
> changes from v2:
>   - added new bluetooth subdirectory and moved files there
>   - removed minItems from local-bd-address
>   - dropped bjorn.andersson@linaro.org, bgodavar@codeaurora.org and
>     rjliao@codeaurora.org due to bouncing emails from the CC list
> 
> changes from v1:
>   - removed blueetooth.txt instead of just replacing it with a
>     deprecation note
>   - replaced references to bluetooth.txt
> 
>  .../devicetree/bindings/net/bluetooth.txt     |  5 ----
>  .../net/bluetooth/bluetooth-controller.yaml   | 29 +++++++++++++++++++
>  .../{ => bluetooth}/qualcomm-bluetooth.yaml   |  6 ++--
>  .../bindings/soc/qcom/qcom,wcnss.yaml         |  8 ++---
>  4 files changed, 35 insertions(+), 13 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/bluetooth.txt
>  create mode 100644 Documentation/devicetree/bindings/net/bluetooth/bluetooth-controller.yaml
>  rename Documentation/devicetree/bindings/net/{ => bluetooth}/qualcomm-bluetooth.yaml (96%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
