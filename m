Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E085433D1
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 13:41:14 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id k3so4635419wrv.5
        for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 05:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jniYWNW0O39wpTJxa3SQEvop6eWznu5uXxnO2EMbWgQ=;
        b=FBWDFebJdOqOt9UisLdoEICfZUOvdzF4VjQAvexnYvTzYXlNt/8kpZ93WzcGcOScmh
         GSGmXXBlLEH03sbYKwfyYdGJvTvt4pMuzr3QvwOk6Kpg4D/CaMXYF0kQ4MjOSvjV+bAN
         KlEL8mdPr3o/gPPowuH8FFQXdXYrJWnq+OJMUqoW2x21lUo42IHDegHxH9wGE21goH5s
         PTMnWdcixkpnLWd6tjeycsGC2mgjtdXIZ+dqpkzb/RsZGUW8qR8wSIkPtka0Zx/OmEYP
         ce7lM/rKB9WmY38o5PP/PBywnkTlLPXqo5ljii1M743Mgwkq03eN214Npjdq6fbL0aIG
         sAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jniYWNW0O39wpTJxa3SQEvop6eWznu5uXxnO2EMbWgQ=;
        b=B9f0+FH/OPae9/tgdL4CD5yFehDQ9fQT63x8XkHmUUUcEnz4YT6ccPxPOoHi7aS/8s
         PW6fDTPvQd8twfRMr6HNeiKXMVmVjavtDQDdO4r27k6qCrPYNimrs6BP6cg/VpbyUL1D
         HJEV4s642uPCaxYBhY2bclD0bho5eBCMANnqA625C5eziB0isP0G3lo8T/sdtik9uqFH
         bFPU/7hlZraaCeuD31zh8ECLX0sYtCeEJHUIkt0HLvySmM4FfsIe0SwfHh9EUM7Qd+Q+
         gVtbJnyP82/59lHPp/9wlzSff+pWWNjhK5Orjf2BgXDMz1zrd72m4ck8qJrZ7BrNDWzk
         pMgw==
X-Gm-Message-State: AO0yUKVlgx+aXpem6Hd84HWBUjl3I73jS7wWS0uoFPSKQdg8XVMNgWDt
	CmQgcHRIZ65KqeUsJosj7Le+zw==
X-Google-Smtp-Source: AK7set9Ck5nVtGr3AA0e07USwlY0O4KmviAeT07ZvvWqq9KVybVYwczKDubU1V+AXYHkIkH/gEo6Nw==
X-Received: by 2002:a5d:61c8:0:b0:2c5:57d5:ef6e with SMTP id q8-20020a5d61c8000000b002c557d5ef6emr3328146wrv.46.1676295673210;
        Mon, 13 Feb 2023 05:41:13 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q2-20020a5d5742000000b002c560e6ea57sm218722wrw.47.2023.02.13.05.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 05:41:12 -0800 (PST)
Message-ID: <0c74070f-6dbe-9379-3acf-85d173217419@linaro.org>
Date: Mon, 13 Feb 2023 14:41:10 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 14/17] dt-bindings: sound: apple,mca: Add t8112-mca
 compatible
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, =?UTF-8?Q?Martin_Povi=c5=a1er?=
 <povik+lin@cutebit.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-14-cb5442d1c229@jannau.net>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v1-14-cb5442d1c229@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2023 16:41, Janne Grunau wrote:
> The block found on Apple's M2 SoC is compatible with the existing driver
> so add its per-SoC compatible.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

