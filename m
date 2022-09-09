Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5BC64E
	for <asahi@lists.linux.dev>; Fri,  9 Sep 2022 14:48:07 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id bt10so3120451lfb.1
        for <asahi@lists.linux.dev>; Fri, 09 Sep 2022 07:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=1Xo/jW7kVhmeqMUm5EF08mo1H5Vri/2WuJWKrRFmb7g=;
        b=oSwLJRjzmYKuS+doOBb65HxYI1YvbLxdKYdXpEje79++9Rj1by9DOE3k1VsooF9TIi
         e1Zw/CBaIz4ppk1yg0D2DzrJ3BqUVC/s5M+XfT+sbBpSbVtUV8yvrTbr8zU8IsiuD/9Q
         imV9nLMCE6NvZqsMvABIpeSeQemrLi8gsmeRK6Oq0HqGj2QCBNh9leOg6HlWzbN3nOAo
         mZ1n8zgg03r08QMwFeNkL7VKyNXEMam8owJq7zQ8XDYklw7YPzkmEtyTFUjqBWZMQlIS
         zn/6hF9iLLJMo++8frY2amYwOd/Mqkna3KylzJt+ZJrEtZJ5hPrXaOBTFSTrRgMXBFTc
         NbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1Xo/jW7kVhmeqMUm5EF08mo1H5Vri/2WuJWKrRFmb7g=;
        b=XFOrPqnBXo4RMDvqVUhTKffN0QfSHn6EXabz9OQEcA9GdIiHnIhUJURQL0Qa2kJIHh
         r+otmMez7ZoX+2dvj3ZhW4Xm3ybMhXO936LvTxPFi8WCDF4x12yOQ7Nzjah6tNCcGXti
         joPIQiniD8NCjqiariHpMTYJBB+iMDOT5aLES/9JDx+AFQLsxedCG8MfgL3FTfTR0YEN
         LN/6ipx8pO5eR4x0I3VE7RLfEBMOhky6ITZIRYWo32CmeR2HC2Fbr2HZTga6BkLPbU3+
         3J9Wo0xZuce1tpYFd7SCD+Nr9Oc+l2p4MIU8PYywoah6nYLJk+QK1Vo2BdNY7Yi+drgK
         wM+A==
X-Gm-Message-State: ACgBeo1KJ/Zm4GplRtRvia8jdKkn1WL3baNj3dVWD/i/goiR/XCY6mpI
	DYknw91GbzD30MvxvkUWX9apvA==
X-Google-Smtp-Source: AA6agR7hWKag4xt7p0pT/feHrJNaWeiDP8haudHJ81x1EwlDjlpYjrTrYeTknUWM4guN+yv0LjJEgw==
X-Received: by 2002:a05:6512:3ba3:b0:497:ad1e:e9ab with SMTP id g35-20020a0565123ba300b00497ad1ee9abmr3921833lfv.619.1662734885375;
        Fri, 09 Sep 2022 07:48:05 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g5-20020a2ea4a5000000b0026707e5a611sm111621ljm.20.2022.09.09.07.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 07:48:04 -0700 (PDT)
Message-ID: <ac0c63a1-9298-568f-d06f-ef7d77ca00ff@linaro.org>
Date: Fri, 9 Sep 2022 16:48:03 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: cs42l42: Add 'cs42l83'
 compatible
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Matt Flax <flatmax@flatmax.com>,
 - <patches@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20220909135334.98220-1-povik+lin@cutebit.org>
 <20220909135334.98220-2-povik+lin@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909135334.98220-2-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/09/2022 15:53, Martin Povišer wrote:
> CS42L83 is a publicly undocumented part found in Apple machines, similar
> (almost identical) to CS42L42. Share the binding schema of CS42L42 for it.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
