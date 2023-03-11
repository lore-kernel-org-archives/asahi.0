Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B54A7B
	for <asahi@lists.linux.dev>; Sat, 11 Mar 2023 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678545095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=INJDANEQXKU0xsqosQ//yXFvq7T3jrX3e/2hzObW3f0=;
	b=OJQS3Elo4K7OMJ5SnIswDt3YXpyyBKdtaMUwYsShKj8YsRXZQv2ii8t1AvqG6wIiZV0qGX
	43rfsXKKfwK91DX+hm7b/HeAJ3DCzgOX9PcosXyt/8DoUwJ6kFFPhhZdr+8gFqXV/uM5xA
	ayy0hCkjXUPe9sN/9IVG1tpD8Ox6fFE=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-YTdx5c1TOJ6PbtWhBaPgcg-1; Sat, 11 Mar 2023 09:31:34 -0500
X-MC-Unique: YTdx5c1TOJ6PbtWhBaPgcg-1
Received: by mail-ua1-f70.google.com with SMTP id cd11-20020a056130108b00b00657d8cfac32so3793323uab.8
        for <asahi@lists.linux.dev>; Sat, 11 Mar 2023 06:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678545093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INJDANEQXKU0xsqosQ//yXFvq7T3jrX3e/2hzObW3f0=;
        b=cTswJmEUHl6CoDj8W/8PHtI2YzVWaeMPu8L7n7DmnhWYO3Nq+sQ44annaRQd84TcVc
         E3IYRyLoUxhougZHI19jBUUd1YMOO8o6SoxqT1KuavB3gjF3QYvH9SGfdNWiNmpH0EyZ
         uWFEUJuIHAue+5Y4dk4+9Dyjq84bEqavzI55UL96dyiGdR2ksduOHBRxbT2exOScaEbZ
         XR+7AMcUA6gFqIqcVgmaAUw5mVDyVTl6fNdHrsnMgjZdEm18tp+JpfdUAFxu0qvDtPNn
         kcjaFQTGvIA++0SvyLHUWHJBzJzI3zGfo6iIbB4C22xavpy04VyePPmfVqc1ND6Ovb0O
         zI2g==
X-Gm-Message-State: AO0yUKX5QbcrFaJa23v6/UofDQ2ZeAol2fh2PjMlzG7UcYlKmM9KEBxc
	854LB4olltrFBhKDowgJ/i1HHq2jDqqyeJ1f40WU3dvbmGUIDR99HuD/rHp759C/qSjxaOHiDcE
	5GC58oUiQdDX/VGz2gKz4ZjTsULYpk68dp+JOeW2yh7L+
X-Received: by 2002:a1f:4358:0:b0:429:73a8:6dba with SMTP id q85-20020a1f4358000000b0042973a86dbamr12974021vka.0.1678545093456;
        Sat, 11 Mar 2023 06:31:33 -0800 (PST)
X-Google-Smtp-Source: AK7set8zoROtzVyy3knl/9H3DfJsJJvBDGmhfiN880HUo8QG4OZ5lUIyateA8pR1NXbwisLQVNcIStUvBVgL1TdBOy0=
X-Received: by 2002:a1f:4358:0:b0:429:73a8:6dba with SMTP id
 q85-20020a1f4358000000b0042973a86dbamr12974004vka.0.1678545093176; Sat, 11
 Mar 2023 06:31:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d6851c2b-7966-6cb4-a51c-7268c60e0a86@marcan.st> <20230311141914.24444-1-marcan@marcan.st>
In-Reply-To: <20230311141914.24444-1-marcan@marcan.st>
From: Eric Curtin <ecurtin@redhat.com>
Date: Sat, 11 Mar 2023 14:31:17 +0000
Message-ID: <CAOgh=Fw7ULhH0PrANYHwqz504SMfNfooUBBjaU03e8L2uhuzPg@mail.gmail.com>
Subject: Re: [PATCH] wifi: cfg80211: Partial revert "wifi: cfg80211: Fix use
 after free for wext"
To: Hector Martin <marcan@marcan.st>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes.berg@intel.com>, 
	Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexander Wetzel <alexander@wetzel-home.de>, Ilya <me@0upti.me>, Janne Grunau <j@jannau.net>, 
	Hans de Goede <hdegoede@redhat.com>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	regressions@lists.linux.dev, asahi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 Mar 2023 at 14:28, Hector Martin <marcan@marcan.st> wrote:
>
> This reverts part of commit 015b8cc5e7c4 ("wifi: cfg80211: Fix use after
> free for wext")
>
> This commit broke WPA offload by unconditionally clearing the crypto
> modes for non-WEP connections. Drop that part of the patch.
>
> Fixes: 015b8cc5e7c4 ("wifi: cfg80211: Fix use after free for wext")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/linux-wireless/ZAx0TWRBlGfv7pNl@kroah.com/T/#m11e6e0915ab8fa19ce8bc9695ab288c0fe018edf
> Signed-off-by: Hector Martin <marcan@marcan.st>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
>  net/wireless/sme.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/net/wireless/sme.c b/net/wireless/sme.c
> index 28ce13840a88..7bdeb8eea92d 100644
> --- a/net/wireless/sme.c
> +++ b/net/wireless/sme.c
> @@ -1500,8 +1500,6 @@ int cfg80211_connect(struct cfg80211_registered_device *rdev,
>                 connect->key = NULL;
>                 connect->key_len = 0;
>                 connect->key_idx = 0;
> -               connect->crypto.cipher_group = 0;
> -               connect->crypto.n_ciphers_pairwise = 0;
>         }
>
>         wdev->connect_keys = connkeys;
> --
> 2.35.1
>
>

