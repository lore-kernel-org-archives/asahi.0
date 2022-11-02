Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1251E9F9
	for <asahi@lists.linux.dev>; Wed,  2 Nov 2022 16:41:08 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id b9so10793049ljr.5
        for <asahi@lists.linux.dev>; Wed, 02 Nov 2022 09:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lmabQ6QIrPhC6gHbbbnIOeOPPxHLqb9/uiOG+55mjHA=;
        b=EHXyQjGjv+nNN+CsohFOura4RO576Rjv0DVdD2nvgit2YYAI9ZuXI30zP8hsJMsetM
         P+KFkGBH7LdzTUn16idjtEATjLbO3ah88mFwF2yeRSmI7Vx877Ixlp/UxXB7vFNmNitw
         I90PzzpQF+JADtng9we9CUcvh8PI4eJtVMAhUGliOPARXfEkpGysY/UXKJtH4YPkVBlR
         Xu9KTK4FVR+J8Ok9hqSyUBCI+8stYzJ/OrjiZddwXFYHcW1Qk+1wlFUQiXpmM2e73TUu
         4MRFv/91gaXZxTds9QUXWoUVFPrhvWfR4O77n99gO0tPKUjDuWCYAZkW6/8T6vf1FtGO
         /RLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmabQ6QIrPhC6gHbbbnIOeOPPxHLqb9/uiOG+55mjHA=;
        b=2fEtSfAf4VNVzmsZwrUTsSIwDHw19WjXxrUJ4fXzGehBbUzQltkgZwvLj3aB7dED4W
         mL7yH9oe+4oAyzHMVEy0Ah5rm6/ZcS5+Tmyt6w5BHphEujEeegKVOfC+vAtMxMq0IbBl
         1mzpMsyba3UWWEY6cHNdL1VsqwQtB+m/gsbD84P4cT2tG0VNkOc4M/lx54b3TCKGhi1T
         b+JrNA96fLAaRff80EDn1NJTC2/kl2k8Ln6KCasK8yHIjACH8dk8cFjcsUCvLWghIYy6
         WPzSNwQIi8qzUmxQqz6jJ7NuHR7pz3RrGMCDZTHHNWxGZvsEDtlaG7WgsKaYvprm1MrL
         w2ww==
X-Gm-Message-State: ACrzQf0DZr7m8xcs0kjTk5r3su9bOINIvEQyYWVT9R+yvJXLiVFMuaqi
	NXPSpR+vyyVxLVM6XbipD36OkwvWyCnohMTS+P8HL8bb
X-Google-Smtp-Source: AMsMyM50B4ChTwri3pNUdk19+lDukowim5+VjCFJbaPQpHVCNpnBCROgFwgMd33+grSqlAzw939nkrL9s+SZ1N04mtw=
X-Received: by 2002:a05:651c:12c2:b0:26c:13b9:a694 with SMTP id
 2-20020a05651c12c200b0026c13b9a694mr10190419lje.79.1667407266631; Wed, 02 Nov
 2022 09:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221102141513.49289-1-fnkl.kernel@gmail.com> <20221102141513.49289-3-fnkl.kernel@gmail.com>
 <OS0PR01MB59227A9E7B8A471E4D6B665786399@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMT+MTT1ptFymwDdOe=OXYzKfOPHdQbAfpx_9LBYn+C9NFhddg@mail.gmail.com>
 <OS0PR01MB592217539BCA46FD8F523C2386399@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMT+MTQLJZsDSOtcQqV8e_j0XKfjNm+dVjeo7ocMjcYOPLAPvA@mail.gmail.com> <OS0PR01MB5922EC4F1AF0D8501D7CB1BF86399@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922EC4F1AF0D8501D7CB1BF86399@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 2 Nov 2022 19:40:55 +0300
Message-ID: <CAMT+MTT+Z=K7BNq=KWGxaT=x9BOfdDecsZ6E7eGhjN5OHRjy=w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pwm: Add Apple PWM controller
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "marcan@marcan.st" <marcan@marcan.st>, 
	"sven@svenpeter.dev" <sven@svenpeter.dev>, "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>, 
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Nov 2022 at 19:29, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Then enable the clk whenever pwm is enabled
> And disable the clk whenever pwm is disabled.
I can do that, but I do not see the point in doing that. This clock is
active whenever the system is turned on, all this will result in is
some unnecessary clock refcount increments/decrements.
