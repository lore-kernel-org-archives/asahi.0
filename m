Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F342C9C
	for <asahi@lists.linux.dev>; Sat, 31 Dec 2022 19:28:28 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-14fb7fdb977so21632326fac.12
        for <asahi@lists.linux.dev>; Sat, 31 Dec 2022 11:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AacQ+BIU1NHX+HGWy2UaEC3c651ZlmPMNCs6AfkyBMA=;
        b=LqUva2Wm6OqLHlGRHfJtVRhZrWxYiPRL2PgvFyNsRS9LfPLwk4r+mb+eCVA1IbmWok
         jSzNxXaWnbVuk8gW8xx6VR38r8sFGvl/gnEM9+DRzCYJpdvCbS1fo2kobZ6aTJy8E2sS
         o7xTqo17U7F0tFcsN53l8V9+Jp0rNNUTtRbNvo51ySrqZhQIdLDLjZgO8Rpp8wvddf22
         dDb+JwjVZAZx73vhLoPEDlgQkW/7KmSCttf58SjBSiW5WHhZ0t8dBKjjEvO/VGit2nIG
         JU9cVvyR4VM9puBYZty1mqbjWLkxuZHB5MaXK0X3zM2NQy7/KaFSNOE9htsluCzrc/bs
         Xeog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AacQ+BIU1NHX+HGWy2UaEC3c651ZlmPMNCs6AfkyBMA=;
        b=MSpecwX1526bDwDL2WMSjTkAv+pVCa1oe4pz0+MBOqmbqYcSofw3WblzdZITlR/dIt
         xlL8reskENkLO7h3QkCfR/UoEgraK0sLZHVi9zskqVlMYsMSS4/AuZvf8KkskVD/LrV1
         TldxU0unMbtwA1TMCq4yvQc0UGtWLEts1Rz2sH+A8QVPbW9byjfnWo1BkNIHYX877NTy
         gu3oz5a0oMH1XrCX9Oi68K+LqkMFIkwoonIR9GEobd8d9wWS3+4ch86nVSEw6CMJTrAl
         OI9TvhhxnKLkw/WP7kV/A6vPXr0qcte7kkD4HqEGA2A4TfAn6OIJE735rzeDxT/eQ+93
         N1OQ==
X-Gm-Message-State: AFqh2kpTq0YSupMqqcIgYyet3HF4q/ET4UZICe8RQkZiF4bKz0K5fRzJ
	1ccQaKkC7mZp9wAP7q/kByA=
X-Google-Smtp-Source: AMrXdXubNlFqmaDlYAzmKzsC5OUs7R1upuNYVGc/H7bns+wwN16DlMUT8Pojeg0Zofrpfj+0Y3fw2w==
X-Received: by 2002:a05:6870:1b09:b0:144:c28c:f7da with SMTP id hl9-20020a0568701b0900b00144c28cf7damr17978434oab.39.1672514907251;
        Sat, 31 Dec 2022 11:28:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y12-20020a4a9c0c000000b004a09df5a1dbsm9693998ooj.8.2022.12.31.11.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 11:28:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 31 Dec 2022 11:28:24 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: apple: Use devm_clk_get_enabled() helper
Message-ID: <20221231192824.GA3434944@roeck-us.net>
References: <6f312af6160d1e10b616c9adbd1fd8f822db964d.1672473415.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f312af6160d1e10b616c9adbd1fd8f822db964d.1672473415.git.christophe.jaillet@wanadoo.fr>

On Sat, Dec 31, 2022 at 08:57:22AM +0100, Christophe JAILLET wrote:
> The devm_clk_get_enabled() helper:
>    - calls devm_clk_get()
>    - calls clk_prepare_enable() and registers what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids the need of a dedicated function used
> with devm_add_action_or_reset().
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/apple_wdt.c | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
> index 16aca21f13d6..eddeb0fede89 100644
> --- a/drivers/watchdog/apple_wdt.c
> +++ b/drivers/watchdog/apple_wdt.c
> @@ -136,11 +136,6 @@ static int apple_wdt_restart(struct watchdog_device *wdd, unsigned long mode,
>  	return 0;
>  }
>  
> -static void apple_wdt_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static struct watchdog_ops apple_wdt_ops = {
>  	.owner = THIS_MODULE,
>  	.start = apple_wdt_start,
> @@ -162,7 +157,6 @@ static int apple_wdt_probe(struct platform_device *pdev)
>  	struct apple_wdt *wdt;
>  	struct clk *clk;
>  	u32 wdt_ctrl;
> -	int ret;
>  
>  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>  	if (!wdt)
> @@ -172,19 +166,9 @@ static int apple_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(wdt->regs))
>  		return PTR_ERR(wdt->regs);
>  
> -	clk = devm_clk_get(dev, NULL);
> +	clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(clk))
>  		return PTR_ERR(clk);
> -
> -	ret = clk_prepare_enable(clk);
> -	if (ret)
> -		return ret;
> -
> -	ret = devm_add_action_or_reset(dev, apple_wdt_clk_disable_unprepare,
> -				       clk);
> -	if (ret)
> -		return ret;
> -
>  	wdt->clk_rate = clk_get_rate(clk);
>  	if (!wdt->clk_rate)
>  		return -EINVAL;
> -- 
> 2.34.1
> 
