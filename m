Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843747B
	for <asahi@lists.linux.dev>; Fri, 19 Aug 2022 06:12:37 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id s1so2071907lfp.6
        for <asahi@lists.linux.dev>; Thu, 18 Aug 2022 23:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=JT4d+qIXOiD2c32PCe7VpC8Thaw9HKeDvaLegiyeoBs=;
        b=LlBUFZ0KtnEfoOPCl6+O8eSzoVMWvALL1/uzU8K4LZM4oP1qaxQmyOh4Q5o0/FdWij
         XD0AXh0ohnUTEGwV6ZrBbptWn+nXE5Lp7eG/vEcagIUmTK7NTCXsfQTXcY4SQpal6b+o
         kJeA6rdNrAUqfkW9R1iK3AmiFII5BYHSRObG6w7vxsUAxgXJq3Bwmv93yY7BzQRFlFQt
         57ll7i7YbB6G6ZeylC0kOoCeg4tCtBAstcxc1pymcsPIETiJumcQgMamBnkUAsrLupLM
         NLw4aaHGLsLbd6dB+68tHIcM3cjLgs+eD/KlyrA37JCl81+D3yLDnVX/YmjCHLscHwFf
         mv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=JT4d+qIXOiD2c32PCe7VpC8Thaw9HKeDvaLegiyeoBs=;
        b=TnRL3Qm13LKm0O+1iGCo7A6b+DJvu2JqHQ0McbK9zeDsFUVBV4lBSXBY4WuRHhOSfo
         rDRAxxGzs/ZDjxyuVoIk/J5OfHs546rjq4aspsayHuDkLUMgISfOBQ3Z4fMKAiWhri1n
         airl79kmGtl1BMiY7zHBj9HrJ3gxwWy3EwHwLQYKen0DTUuwI7krU/qD+oG6F7iUf8UY
         0PLp/HwJz1nq4vhtHskC4r8CcSlMkC8FmO4al26XiQGc9rDU2GNbnSYOOQTqr/gUF9T1
         /5y38mJ2sP5wzhgu/VVApu6RYIV3ooYzujx1liXZW8267XzWSrOp261SPL78OgtVDMZS
         ZR4Q==
X-Gm-Message-State: ACgBeo3sq0RVgZgDqqVZwMcefJgsZV7LAdQ3JTu7hx+XwXmwFO3EmhSH
	uQ9vF26mYdLmujhzgOSHg377Nw==
X-Google-Smtp-Source: AA6agR6egBZWlTgL+lYH4tALCwa73LhErjRYFg+F5pOPcScNcEExN8yGp7Q5NJ4D804cjTkDXUtk1g==
X-Received: by 2002:a05:6512:32c2:b0:48b:373b:5503 with SMTP id f2-20020a05651232c200b0048b373b5503mr2055113lfg.192.1660889555612;
        Thu, 18 Aug 2022 23:12:35 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id 2-20020a2e0902000000b0025e6a3556ffsm467473ljj.22.2022.08.18.23.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 23:12:35 -0700 (PDT)
Message-ID: <ce1ea6c9-79bd-5dfa-41c9-38e49c9df735@linaro.org>
Date: Fri, 19 Aug 2022 09:12:33 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/3] ASoC: apple: mca: Start new platform driver
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220808224153.3634-1-povik+lin@cutebit.org>
 <20220808224153.3634-3-povik+lin@cutebit.org>
 <53c8f062-a760-c65f-479e-53e7991b3f66@linaro.org>
 <82B580B4-85BF-4ABA-B098-98E3CA9EE247@cutebit.org>
 <414CEE0D-AED4-4900-88BE-A3BD993D79DD@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <414CEE0D-AED4-4900-88BE-A3BD993D79DD@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/08/2022 20:54, Martin Povišer wrote:
>>
>> Same as above, there’s supposed to be
>>
>>  resets:
>>    maxItems: 1
>>
>> in the schema.
> 
> Preparing an iteration of the series, I see there *was* the reset in
> the schema. Let me know if there is some issue with it.
> 

Indeed there is one, I missed it. It's OK.

Best regards,
Krzysztof
