Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE727F8;
	Sat, 18 Mar 2023 07:57:10 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id fd5so28544304edb.7;
        Sat, 18 Mar 2023 00:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679126229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCrLidp4OVEXWIbXwYSJK83G0PQpXkPRHVsrJ8zeqyc=;
        b=gn2IS9EeMuuN2iJYYd/yuXLOvz9qmg4U/sRPP40yWOvsWVZbeFifHw4f2weg80aGCC
         tLvYsdGIoe+NWqDIrMT7h9Iv2tUJP028uUZtEOUI29xEqBu1bO17Ct98eRg5F4+E4PUo
         BuwKY38VUfAMTJMzL9VL8IvtDVbj0aa8mdo677TtnT+9AitEy4hmWH81wjyW1DMSGCrf
         45U5Uh8eTLf9neZoSFsOeXK30Za/TzDdtGT7GW7refAg45BgltukIbCQEQiSwCduEPPu
         fY3XhiVCrA+Z4hjixcvvQGNcxGYuKKo04EgyflcVtlQFuOt7eF8zRwftYoAdGSAtjuZ4
         Cv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679126229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCrLidp4OVEXWIbXwYSJK83G0PQpXkPRHVsrJ8zeqyc=;
        b=ruBGMoK3rSdMeKG8uvSvxxbWmfNhVzGLUX7M8s5ljeX+8an17eOwF59G1iUFUs1Vdv
         eX6LSW62ipwHgBo2wdCGV4q5nZboDRovB/dEAIM08uT9LmaNAOkO7agY31q3Xgok5OY/
         JlKH5h9U9tiNX/z3vFZnHw7dgp3sUJz1H4JhCbOQxpmPSB71OlaE2XyGFWw5dAu2pieU
         eQmLR0lRACEQbHQk1PY/eVngsHlZheWyggp+CgCW9O8Tm5pxyhCm1BYwhKQrmWG+bxXZ
         TA/YNPV6GB3c0AVqn2AHNVrnWIjHlW6+QWJZ8kY8vJNUwI8xD7ffAMpg0p71EWqUR2mi
         vuFQ==
X-Gm-Message-State: AO0yUKVnO2+ravzfgi6l0N/a9FH0VhqdXa/Ohm5gbQ1BmBLrqqvfQpRR
	oqeqqa2Dh0szzAnLPj+YkGY=
X-Google-Smtp-Source: AK7set+ZpTCTkVBDtoYBzI61rbVWTHWDTXRpYAoEc8uSO+dGa58EHpp0+H/L9Ew3/QTlDkVyPDgPGw==
X-Received: by 2002:aa7:c9d5:0:b0:4fb:e9b8:ca56 with SMTP id i21-20020aa7c9d5000000b004fbe9b8ca56mr4490833edt.41.1679126229004;
        Sat, 18 Mar 2023 00:57:09 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id c25-20020a50f619000000b004bd6e3ed196sm2002916edn.86.2023.03.18.00.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 00:57:08 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Shih <vincent.sunplus@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: nvmem: Drop unneeded quotes
Date: Sat, 18 Mar 2023 08:57:06 +0100
Message-ID: <5656590.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230317233640.3968821-1-robh@kernel.org>
References: <20230317233640.3968821-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 18. marec 2023 ob 00:36:39 CET je Rob Herring napisal(a):
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml      | 2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  Documentation/devicetree/bindings/nvmem/apple,efuses.yaml       | 2 +-
>  Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml         | 2 +-
>  Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml | 2 +-
>  Documentation/devicetree/bindings/nvmem/imx-iim.yaml            | 2 +-
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml          | 2 +-
>  .../devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml         | 2 +-
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml     | 2 +-
>  .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml       | 2 +-
>  Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml          | 2 +-
>  Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml       | 2 +-
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml        | 2 +-
>  Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml     | 2 +-
>  Documentation/devicetree/bindings/nvmem/rmem.yaml               | 2 +-
>  Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml     | 2 +-
>  .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml     | 2 +-
>  Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml     | 2 +-
>  .../devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml         | 2 +-
>  18 files changed, 18 insertions(+), 18 deletions(-)



