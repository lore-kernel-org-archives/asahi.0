Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37AE107B7
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:08:28 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id a2so15218960wrd.6
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KLwpA0OxwlMvnto1nGfqBS7cDyIxy6xw25nq/tSi2dw=;
        b=eLCKenMFYhiaDpe4BJTbOvy22gGFMA91IudxvPqMa+ANIyjQXUd7rt7rjPZoAiZTC0
         Qqbsv5CaTOKvz0K5QbhQDE5s7LHmYj23gxZyhgkR+IhBfVLI/ypyqC2aeafsCSIjR+Hb
         QHln73xhqBb8YRbEOJat0mbrJnhy2DaYTiqKUhk540uUaY33TyiCd5KxOCJDkH08Ibtk
         R32RpZkcI4pEZe71Uh+7y2m3p+oucOZX7puKEC+bTT2o5CWoBLLUuSONbHFvP84UmbE7
         flpLE8SdAnNJNJhwbAUKrX7TsckRbdGqyBTqLXdClpMIg34g2gblNa7beO7EHcE3YWC7
         HLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KLwpA0OxwlMvnto1nGfqBS7cDyIxy6xw25nq/tSi2dw=;
        b=7CHAGMxhBkWV/0nHMgqOK1/XR1zz73D3gmrZnzl2cN8pU0SCdFeNyDTwIcK8/3gSwJ
         GPpFbDl1m0kUmlODfYCeCwb96ehwyniREPD5w6ck2JkRsm7S6/JBvXIviYa4fUb1bluq
         sX2rEfuMh0JkyH8tDrVXdfQtKmhFN2sOwGMF0aeJfmFB75+tEjMsC4U4nNJ9YAbKvQQ+
         1TLOm6psTAmxrRVAanLpcqrEoujzUiGBddRe2JqbagQtOyp19XSYFUBtVW2yhvCxutlo
         gkiDEJTmVoZAVwNUdG4C1ZOadnv8DGw9ra0v+V/7WNmO77bmAgd4cVH8S4dXav1CZFpz
         B7gA==
X-Gm-Message-State: AO0yUKWjgXki8oTE7x2OQLJ5pNRn1c86IPHEPgXtpQJlhYRpAVrCIh9L
	wvLZu18FC4yCR+geXYUmKL20zQ==
X-Google-Smtp-Source: AK7set/RCCSzTIVHoLl3oD806xljlfED19rCaLzBbhEio+ZFt+dEIFFbAFI9S3/8Q8/K34jT1rlSdA==
X-Received: by 2002:a05:6000:1a43:b0:2c5:561e:808e with SMTP id t3-20020a0560001a4300b002c5561e808emr1377566wry.12.1676372907264;
        Tue, 14 Feb 2023 03:08:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j16-20020adfff90000000b002c55efa9cbesm3274456wrr.39.2023.02.14.03.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 03:08:26 -0800 (PST)
Message-ID: <15bdceea-0faa-4691-d977-6d74dfe29b02@linaro.org>
Date: Tue, 14 Feb 2023 12:08:25 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 14/16] dt-bindings: dma: apple,admac: Add t8112-admac
 compatible
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, =?UTF-8?Q?Martin_Povi=c5=a1er?=
 <povik+lin@cutebit.org>
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
 <20230202-asahi-t8112-dt-v2-14-22926a283d92@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v2-14-22926a283d92@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2023 12:03, Janne Grunau wrote:
> The block found on Apple's M2 SoC is compatible with the existing driver
> so add its per-SoC compatible.
> 
> Acked-by: Vinod Koul <vkoul@kernel.org>
> Acked-by: Martin Povišer <povik+lin@cutebit.org>
> Signed-off-by: Janne Grunau <j@jannau.net>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

