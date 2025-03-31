Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6FE15530C
	for <asahi@lists.linux.dev>; Mon, 31 Mar 2025 09:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743414367; cv=none; b=KBXBD22xqpo3aclM64mGmqvUXP/f9UVUta8hJn6ibo39EUwJm5Ah4r17Rlzqwqo3qqADH87Q1maGjYdjtImUS9ChsppRYA2XMWUNgVNTRpByXddULdrI54eIT16oGh8wHKa7Gu9PTIyMe86YYrUOfnL8VXAzeJBZHgOS5tj4sM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743414367; c=relaxed/simple;
	bh=yjtFOHFGhUmChOVrgFoaN0q717UruW27SSkc07M+s4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SdqKAK4CcR/uPTBJpI2VSywshNqXXx5wJT95bjsmQbV8RaNtRKCEElccApEKl3M2kJEgBp8mXR02vnU/Xzaienq3KnNVKBLLnwngQOrvJOBXBXMuS4WuYmyJT5LIZwjYBL8I0WJtq8Kbe8mJVv1gaY0jDEhv5FU0cJJUcrUVpNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PZmAY2bW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PZmAY2bW"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so25195145e9.1
        for <asahi@lists.linux.dev>; Mon, 31 Mar 2025 02:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743414364; x=1744019164; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vdfZf6Qf3Rc2A3D8YxoEXa1CISDhOTToLVsDJBTF8Kk=;
        b=PZmAY2bWjSSi6ZawVKq4CMgm0othhAd0ZdcEAmFZtJoV3IzH2Jq82U3h/tF8+BqUsB
         4SRuW2cKd+P/WEgALBoSkDVXCrNRDyrj2zE0Z3chtQynVo8peezgIaJxyRA3ViiCZ1MK
         DCh+vo9aSReN+sCu2e7aU8eyniQ05ZHf1UNMzEzL8i+Kgt38O+cA0H0JShvF+RDoH00+
         wB3W9hAaZrz2Q3ISTA9K+/Qn1UxO1lFqdvAPF6cvmo3TdpfGhsIWdyChRYeCQAEzK5OO
         bRY9LcOVsJLCiJmiwjQCpkObrwtVJbAW7282WT8WwvheL/tA4ZT7QvlYNB/oPBuYL1/e
         /MLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743414364; x=1744019164;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdfZf6Qf3Rc2A3D8YxoEXa1CISDhOTToLVsDJBTF8Kk=;
        b=g0Ka+A3UBSSLl2cxxQEr2pwR14jnN2gk9tdFk+tL5/YdL7VGYcFvNp0nY4R1fX8ZHN
         s7AXOiVQPzhoTSDtjju1oAsWKmRNmlb6Nkat6AfA9Ye/cYdBm3gvTDrMJDTxa3IJrsRF
         7v+41/7OvLTf+apZsNGGbtBKvqARqoDWMXuxEgiTuS/3CjMgNIsCCg+zucbLcouMihcI
         cxRNWWveAdm33RaDbsoGHw1h38D66Gj7faM0FZShj+Wq9ONpSkCaLYDpNrdoqKvpuGUP
         +omEcyFWNSwqVbrHTABTc+LojNOb/O0oRQnINoGHudevo2gfSLrKms79pv5+wRF3DWdy
         bciQ==
X-Gm-Message-State: AOJu0YxnG4W2/vi3pvedhSdEJzkpxpvwEx2fIgpqQa7LoUBx2dxgfHVe
	S5dcB7ecm8E7KgZ7KHX/YRyN4M8T8Cstb8PLVz5+gtvNZZWyhzt3aq7FdlABNjY=
X-Gm-Gg: ASbGncuGxnGSJ+tXY2SfAupaI6P+2WPna212sN2FrzW8+ilu+OgpRdIetGXLhKLDN54
	7HnYYuDRjddYLzsPjKsEQCdq/WJVOERYZXk7qfi6hUudLn5qoxHYatFTRevPrquYxTAmwajWZ0y
	BlyD5oj+vpbT5CSGL+haCVp2woe0RX9d0eeEiZvKLM+ZKxUPo2G7ySYbS/6nQRjEbgWSiFrIQNI
	s7jjJ6d3a2fKY5LvlRT489OSwS7dFUh0CchtbPx8BrDjDXwFuCzQNZ0NJ98WyzvM2QAEKfWjBz+
	QLWKt6eueY73rmfHAhppmMjMb/kJVIVa6oJq/XzNosZeBvKZdw==
X-Google-Smtp-Source: AGHT+IGwVTWwoc2dmQj/y3w2I60/EBThtOQJYUV6tW7X7RY5Of9dMyc5g6yuGtRo0dcUomun/LluaQ==
X-Received: by 2002:a05:600c:310c:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-43db6224034mr54503175e9.4.1743414364456;
        Mon, 31 Mar 2025 02:46:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d8314b6dbsm161982895e9.36.2025.03.31.02.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:46:03 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:46:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [bug report] soc: apple: rtkit: Port to the internal mailbox driver
Message-ID: <dfc20338-680e-4ae5-a569-f54eecefa0c4@stanley.mountain>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Hector Martin,

Commit bb538effdc71 ("soc: apple: rtkit: Port to the internal mailbox
driver") from Mar 14, 2023 (linux-next), leads to the following
Smatch static checker warning:

	drivers/soc/apple/rtkit.c:696 apple_rtkit_init()
	warn: 'rtk->mbox' can also be NULL

drivers/soc/apple/rtkit.c
    686         if (mbox_name)
    687                 rtk->mbox = apple_mbox_get_byname(dev, mbox_name);
    688         else
    689                 rtk->mbox = apple_mbox_get(dev, mbox_idx);
    690 
    691         if (IS_ERR(rtk->mbox)) {
    692                 ret = PTR_ERR(rtk->mbox);
    693                 goto free_rtk;
    694         }
    695 
--> 696         rtk->mbox->rx = apple_rtkit_rx;
    697         rtk->mbox->cookie = rtk;
    698 

The issue is in apple_mbox_get()

drivers/soc/apple/rtkit.c
   283  struct apple_mbox *apple_mbox_get(struct device *dev, int index)
   284  {
   285          struct of_phandle_args args;
   286          struct platform_device *pdev;
   287          struct apple_mbox *mbox;
   288          int ret;
   289  
   290          ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
   291                                           index, &args);
   292          if (ret || !args.np)
                           ^^^^^^^^
Should we return an error pointer if args.np is NULL?

   293                  return ERR_PTR(ret);
   294  
   295          pdev = of_find_device_by_node(args.np);
   296          of_node_put(args.np);
   297  
   298          if (!pdev)
   299                  return ERR_PTR(-EPROBE_DEFER);
   300  
   301          mbox = platform_get_drvdata(pdev);
   302          if (!mbox)
   303                  return ERR_PTR(-EPROBE_DEFER);
   304  
   305          if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER))
   306                  return ERR_PTR(-ENODEV);
   307  
   308          return mbox;
   309  }

regards,
dan carpenter
