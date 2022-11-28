Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843AB8C1D
	for <asahi@lists.linux.dev>; Mon, 28 Nov 2022 14:40:24 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id q7so13366025ljp.9
        for <asahi@lists.linux.dev>; Mon, 28 Nov 2022 06:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+NiUJlplsn9n6lGGdwaVYz/dvUY1Uiz0F8E0WFP5MXA=;
        b=mUY4sXo496dMgRbJDhldHGyTbaS60fNegypcclPyzw/16zckDxAqi3rx0MG0tMyZos
         /7D+YrPdRYNYrR0EQnrbNQ/Q7htyuzDboExz/O3YGlCiAyaKlHnA/LTUkhbf6JtqpHpt
         2a4atD5Hk3YCkU12y6mMmxHSEa0VzAZ70FoCzLTmC99SMuDsL/FZ65NKmqm1OcdqW+pi
         ZBKA6C6ih+VqgYVPK6fnGXgWKT5WeQLTANBTCenMqP7Jd5vPSP9gvq31OFElyn2yfsDa
         5Y+f5SE9f3mOD4n68ud7YJ1SULJg26cRV5YGQfbMLwKltMl2Ld0ElsvKRB0dwrS5j08o
         Wq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+NiUJlplsn9n6lGGdwaVYz/dvUY1Uiz0F8E0WFP5MXA=;
        b=4eSMyLDR4rZuSwNPAflSZzS7/l2sFuWbrojEv0TFciMI3Bihztij2RDua69Z2cP713
         Te+qX5vYSZreY080cDVtSZdEl+8B7b1qBfUsPxW7lX8PVRI/hgiM3vTZlTsPcWV5rbS7
         TSNARSqycAw0vEREBaib+Abz0CyVZxfaSsRR45ybl3pbZmmKyIWwRQoRVMnqv7FFAZ5a
         aQm+8jw9VnaIOqk+A7sJXCN0TD5uT0KbiiwGylQoINPunW7gSEy6olZafOR5P0WiXNjX
         BgosIpcbIOriCaF84/joMqTj+HgxygVJhCrAKgiuqhU4ft2ag9wSuVUMxZUER5+G3BpS
         m6KA==
X-Gm-Message-State: ANoB5pkzg/AbuURUhmYHZP0sPDgFXsWZpL1ecC0/Ogxfztlk99RfPSHw
	TV4kjYkUQmO/0B3KNS8lS+MP7g==
X-Google-Smtp-Source: AA0mqf44My3TSiQHWXKUbpZ8nXgALHNbYVtTj2k2cv7Q5oTPCaZ+9Bd9an1qmJv5RwWvKlqF7DwXtw==
X-Received: by 2002:a05:651c:b0e:b0:277:3ca2:dac6 with SMTP id b14-20020a05651c0b0e00b002773ca2dac6mr15718506ljr.143.1669646422586;
        Mon, 28 Nov 2022 06:40:22 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id cf39-20020a056512282700b004a0589786ddsm1752136lfb.69.2022.11.28.06.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 06:40:21 -0800 (PST)
Message-ID: <5c8c10c7-0d2d-25ff-1bed-d75dde93ee75@linaro.org>
Date: Mon, 28 Nov 2022 15:40:20 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 2/4] dt-bindings: cpufreq: apple,soc-cpufreq: Add
 binding for Apple SoC cpufreq
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Mark Kettenis <mark.kettenis@xs4all.nl>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221128142912.16022-1-marcan@marcan.st>
 <20221128142912.16022-3-marcan@marcan.st>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128142912.16022-3-marcan@marcan.st>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/11/2022 15:29, Hector Martin wrote:
> This binding represents the cpufreq/DVFS hardware present in Apple SoCs.
> The hardware has an independent controller per CPU cluster, and we
> represent them as unique nodes in order to accurately describe the
> hardware. The driver is responsible for binding them as a single cpufreq
> device (in the Linux cpufreq model).
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

